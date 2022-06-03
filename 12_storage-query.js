let storage = []

let callbackFNConstructor = (index) => (error, contractData) => {
  storage[index] = contractData
}

for(var i = 0; i < 6; i++){
  web3.eth.getStorageAt(contract.address, i, callbackFNConstructor(i))
}
