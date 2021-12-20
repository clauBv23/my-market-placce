const {assert} = require('chai');

const KriptoBirdz = artifacts.require("KriptoBirdz");


//check for chai
require('chai')
.use(require('chai-as-promised'))
.should()

contract('KriptoBirdz', (accounts) =>{

  let contract;
  // run this before anithing else
  
  before( async ()=>{
    contract = await KriptoBirdz.deployed();
  });
  
  describe('deployment', async () =>{
     //tests
     it('deployed successfully', async () =>{
       const address = contract.address;

       assert.notEqual(address,'');
       assert.notEqual(address,null);
       assert.notEqual(address,undefined);
       assert.notEqual(address,0x0);
     });

     it('name is correct', async () =>{
      const name = await contract.name();
      
      assert.equal(name,'KriptoBirdz');
    });

    it('symbol is correct', async () =>{
      const symbol = await contract.symbol();

      assert.equal(symbol,'KRIPTOBIRDZ');
    });
   });

  describe('minting', async () =>{
    // tests
    it('check minting', async () =>{
      const result = await contract.mint('one');
    
      const totalSupply = await contract.totalSupply();
      // success
      assert.equal(totalSupply,1);

      const event = result.logs[0].args;
      
      // check the address 
      assert.equal(event._from, 0x0, 'from the contract');
      assert.equal(event._to, accounts[0], 'to message sender');

      // check failure

      await contract.mint('one').should.be.rejected;
    });
  });

  describe('indexing', async () =>{
    // tests
    it('mint kbirdz', async () =>{
      await contract.mint('two');
      await contract.mint('three');
      await contract.mint('four');
      const totalSupply = await contract.totalSupply();
      
      // success
      assert.equal(totalSupply,4);
    // });

    // it('list kbirdz', async () =>{
      let results = [];
      let  kBird;
      for(let i = 0; i < totalSupply; i++){
        kBird = await contract.kriptoBirdz(i);
        results.push(kBird);
      }
      
      console.log(results);
      
    });
  });
});
