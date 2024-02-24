import traceback
import curses
import os
import asyncio
from typing import Dict, List
from io import StringIO
from pathlib import Path
import logging

logging.basicConfig(filename='stderr_output.txt', level=logging.DEBUG, format='%(asctime)s %(message)s')
try:
    os.getenv("FD_PATH")
except Exception:
    print("It looks the enviroment variable FD_PATH is not defined")
    print("Export the variable with:")
    print("\texport FD_PATH=</home/your_user/path_to_fast_downward/fast-downward.py>")
    exit(1)

class CONSTS():

    PROBLEM_NAME = "problem.pddl"
    DOMAIN_NAME = "domain.pddl"

    INVOKE_POPF = "ros2 run popf popf {domain} {problem}"
    INVOKE_OPTIC = "ros2 run optic_planner optic_planner {domain} {problem}"
    INVOKE_FD = os.getenv("FD_PATH") + ' {domain} {problem} --search "astar(blind())"'  

    SUCCESS_ASSUMPTION = "Solution found"

    STATUS_RUNNING = 1
    STATUS_SUCCESS = 2
    STATUS_FAILURE = 3


# Class for saving info about each triple execution POPF, OPTIC, FD
# Warning: Order matters, table designed with that order
class TriplePlanner():

    def __init__(self,
            id: int,
            dir: str = "Uknown",
            status: List[int] = [CONSTS.STATUS_RUNNING]*3,
        ) -> None:

        self.status = status
        self.dir = dir
        self.id = id

class StatusTable():
    
    LINE_LEN = 90
    TITLE = "Planification Status".center(LINE_LEN) + '\n' + '-'*LINE_LEN + '\n'
    HEADER = "  DIR" + ' '*27 + " POPF" + ' '*16 + " OPTIC" + ' '*15 + " FD" + '\n'
    PLANNER = "{status_dot} {dir:<30} {status1:<20} {status2:<20} {status3:<20}" + '\n'
    END = '-'*LINE_LEN + '\n'

    def __init__(self) -> None:
        self.planners = dict()
        self.last_str = ""
        self.stdscr = curses.initscr()

    def close(self):
        curses.endwin()
        
    def __str__(self) -> str:

        # Write header
        s = StringIO()
        s.write(StatusTable.TITLE)
        s.write(StatusTable.HEADER)
        
        # Write entries
        for p in self.planners.values():

            status_dot, str_stats = StatusTable.status2str(p)
            s.write(StatusTable.PLANNER.format(
                status_dot=status_dot,
                dir=p.dir,
                status1=str_stats[0],
                status2=str_stats[1],
                status3=str_stats[2]
                )
            )

        # End table
        s.write(StatusTable.END)
        
        s = s.getvalue()
        self.last_str = s

        return s
    
    def update(self) -> str:
        # Write all the with curses
        self.stdscr.move(0,0)
        self.stdscr.addstr(str(self))
        self.stdscr.refresh()

    def status2str(triple_planner: TriplePlanner):
        # Defines the loading string and the status for
        # all the planers in one directory
        status = []
        for s in triple_planner.status:
            match s:

                case CONSTS.STATUS_RUNNING:
                    status.append("Running...")

                case CONSTS.STATUS_SUCCESS:
                    status.append("SUCCESS")

                case CONSTS.STATUS_FAILURE:
                    status.append("×")
        
        if CONSTS.STATUS_RUNNING in triple_planner.status:
            status_dot = "↻"
        else:
            status_dot = "✓"

        return [status_dot, status]


async def test_problem(
    id: int,
    dir: Path,
    planner_invoke: str,
    sts_idx: int, 
    table: StatusTable
):

    # Generating command
    domain = dir / CONSTS.DOMAIN_NAME
    problem = dir / CONSTS.PROBLEM_NAME
    cmd = planner_invoke.format(domain=str(domain), problem=str(problem))

    # Launching process
    process = await asyncio.create_subprocess_shell(
        cmd,
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE
    )

    table.planners[hash(dir)].status[sts_idx] = CONSTS.STATUS_RUNNING
    table.update()
    stdout, stderr = await process.communicate()

    if stderr:
        logging.debug(f"[ERROR] {str(dir)}: {stderr.decode('utf-8')}")

    stdout = stdout.decode('utf-8')

    # Update table -> Success/Failure
    if CONSTS.SUCCESS_ASSUMPTION.lower() in stdout.lower():
        table.planners[id].status[sts_idx] = CONSTS.STATUS_SUCCESS
    else:
        table.planners[id].status[sts_idx] = CONSTS.STATUS_FAILURE

    table.update()

        
async def main():

    # Obtaining target dirs 
    cwd = os.getcwd()
    dirs = [Path(dir) for dir in os.listdir(cwd) if not dir.endswith(".py")]
    table = StatusTable()
    tasks = []

    for dir in dirs:

        if not os.path.isdir(dir):
            continue

        # Add entry to the table
        id = hash(dir)
        planner = TriplePlanner(
            id=id,
            dir=str(dir),
            status=[CONSTS.STATUS_RUNNING]*3
        )
        table.planners[id] = planner

        # Tasking planners
        for idx, plan in enumerate([CONSTS.INVOKE_POPF, CONSTS.INVOKE_OPTIC, CONSTS.INVOKE_FD]):
            tasks.append(
                test_problem(
                    id=id,
                    dir=dir,
                    planner_invoke=plan,
                    sts_idx=idx,
                    table=table
                )
            )

    # Executing...
        # Executing...
    try:
        results = await asyncio.gather(*tasks, return_exceptions=True)
        for result in results:
            if isinstance(result, Exception):
                print(f"Error during task execution: {result}")

    except Exception as e:
        print(f"Error when trying to execute planners: [{type(e).__name__}] {e}")
        traceback.print_exc()

    # Closing
    finally:

        
        if os.path.exists("sas_plan"):
            os.remove("sas_plan")
        if os.path.exists("output.sas"):
            os.remove("output.sas")

        print("Planning Completed, tap ENTER to return")
        table.stdscr.getstr()
        table.close()


if __name__ == '__main__':
    
    asyncio.run(main())
