pragma solifity ^0.6.10;

interface Building {
    bool public top;
    uint public floor;

    function goTo(uint _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)){
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }

}
