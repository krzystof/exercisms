import math

class Clock:

    def __init__(self, hour, minute):
        self.minute = self.to_base(60, minute)
        self.hour = self.to_base(24, hour + math.floor(minute / 60))

    def to_base(self, base, units):
        if units > (base - 1):
            return units % base
        elif units < 0:
            return units - base * math.floor(units / base)
        else:
            return units

    def add(self, minutes):
        return Clock(self.hour, self.minute + minutes)

    def __str__(self):
        return "%s:%s" % (self.pad_digit(self.hour), self.pad_digit(self.minute))

    def __eq__(self, other):
        return self.hour == other.hour and self.minute == other.minute

    def pad_digit(self, digit):
        return "0%s" % digit if digit < 10 else str(digit)
