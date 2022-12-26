5.times do
    Contract.create({
        userAddress: Faker::Blockchain::Bitcoin.address,
        deployedAddress: Faker::Blockchain::Bitcoin.testnet_address
    })
end