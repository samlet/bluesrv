import threading, time, signal

class ProgramKilled(Exception):
    pass

def signal_handler(signum, frame):
    raise ProgramKilled

class TimerProcs(object):
    def simple(self, interval=1):
        """
        $ python -m scheduler.timer_procs simple

        :param interval:
        :return:
        """
        def foo():
            print(time.ctime())
            threading.Timer(interval, foo).start()

        foo()

if __name__ == '__main__':
    import fire
    signal.signal(signal.SIGTERM, signal_handler)
    signal.signal(signal.SIGINT, signal_handler)

    fire.Fire(TimerProcs)

