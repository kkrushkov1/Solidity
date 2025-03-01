// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({text: _text, completed: false}));
    }

    function updateText(uint256 _index, string calldata _text) external {
        todos[_index].text = _text; // the cheaper on gas way if you have only one field in the Struct. Because each time we access the array at index

        // Todo storage todo = todos[_index]; // If you have multiple fields - this will be cheaper on gas. Because we only access the array index once.
        // todo.text = _text;
    }

    function get(uint256 _index) external view returns (string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint256 _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
