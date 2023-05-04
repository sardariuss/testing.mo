import { debugPrint } = "mo:⛔";

module {
    public class Status() {
        var _pass = 0;
        public func pass() { _pass += 1 };
        public func passed() : Nat { _pass };

        var _fail = 0;
        public func fail() { _fail += 1 };
        public func failed() : Nat { _fail };

        public func add(other : Status) {
            _pass += other.passed();
            _fail += other.failed();
        };

        public func printStatus() {
            let total = debug_show(_pass + _fail);
            debugPrint("🟢 " # debug_show(_pass) # "/" # total # " | 🛑 " # debug_show(_fail) # "/" # total # "\n");
            switch (_fail) {
                case (0) {};
                case (_) assert(false);
            };
        };
    };
};
