
var Year = function Year(value) {
    this.value = value;
};

Year.prototype = {
    isLeap: function() {
        return this.value % 400 === 0 || (this.value % 100 !== 0 && this.value % 4 === 0);
    },
};

module.exports = Year;
