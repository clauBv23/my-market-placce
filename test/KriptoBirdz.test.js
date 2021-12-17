const {assert} = require('chai');

const KriptoBirdz = artifacts.require("KriptoBirdz");


//check for chai
require('chai')
.use(require('chai-as-promised'))
.should()

contract('KriptoBirdz', (accounts) =>{
  let contract;
   describe('deployment', async () =>{
     //tests
     it('deployed successfully', async () =>{
       contract = await KriptoBirdz.deployed();
       const address = contract.address;
       assert.notEqual(address,'');
       assert.notEqual(address,null);
       assert.notEqual(address,undefined);
       assert.notEqual(address,0x0);
     });
     it('name is correct', async () =>{
      const name = await contract.name();
      console.log('name',name);
    });
    it('symbol is correct', async () =>{
      const symbol = await contract.symbol();
      console.log('symbol',symbol);
    });
   })
});