// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");
        E.foo(); // direct
    }

    function bar() public virtual override {
        emit Log("F.bar");
        super.bar(); // super
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo(); // direct
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar(); // super
    }
}

contract H is F, G {
    function foo() public override(F, G) {
        F.foo();
    }

    function bar() public override(F, G) {
        super.bar(); // will call all parents
    }
}
