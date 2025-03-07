// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract VerifySig {
    function verify(
        address _signer,
        string memory _message,
        bytes memory _sig
    ) external pure returns (bool) {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    function getMessageHash(string memory _message)
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash)
        public
        pure
        returns (bytes32)
    {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messageHash
                )
            );
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sig)
        public
        pure
        returns (address)
    {
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s); // returns the address of the signer
    }

    function _split(bytes memory _sig)
        internal
        pure
        returns (
            bytes32 r,
            bytes32 s,
            uint8 v
        )
    {
        require(_sig.length == 65, "invalid signature length"); //  bytes32 + bytes32 + 1 = 65

        assembly {
            // the signature is stored in memory and what we pass in the function is just a reference.
            // mload = load from memory
            r := mload(add(_sig, 32)) //  the value of r is stored in the next 32 bytes after the first 32 bytes are skipped.
            s := mload(add(_sig, 64))
            v := byte(0, mload(add(_sig, 96))) //  get the first byte from the 32 bytes after 96.
        }

        // we dont have to type return since we named our return values in the function input  and then we assigned it in the assembly.
    }
}
