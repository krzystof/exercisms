
class Clock:

    def __init__(self, hour, minute):
        self.hour = hour
        self.minute = minute

    def __str__(self):
        return self.hourToString() + ':' + self.minuteToString()

    def hourToString(self):
        if self.hour == 24:
            return '00'
        elif self.hour < 10:
            return '0' + str(self.hour)
        else:
            return str(self.hour)

    def minuteToString(self):
        if self.minute < 10:
            return '0' + str(self.minute)
        else:
            return str(self.minute)
