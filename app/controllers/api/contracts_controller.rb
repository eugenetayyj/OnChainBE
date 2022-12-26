module Api
    class ContractsController < ApplicationController
        def index
            contracts = Contract.order("created_at DESC");
            render json: {status: "SUCCESS", message: "Loaded Contracts", data:contracts},status: :ok
        end

        def show
            contract = Contract.find(params[:id])
            render json: {status: "SUCCESS", message: "Loaded Contract", data:contract},status: :ok
        end

        def getUserContracts
            field_param = params[:id]
            contracts = Contract.where(userAddress: field_param)
            render json: {status: "SUCCESS", message: "Loaded User's Contracts", data:contracts},status: :ok
        end

        def create
            contract = Contract.new(contract_params)
            
            if contract.save
                render json: {status: "SUCCESS", message: "Saved Contract", data:contract},status: :ok
            else
                render json: {status: "ERROR", message: "Contract not saved", data:contract.errors},status: :unprocessable_entity
            end
        end

        def destroy
            contract = Contract.find(params[:id])
            contract.destroy
            render json: {status: "SUCCESS", message: "Deleted Contract", data:contract},status: :ok
        end

        def update
            contract = Contract.find(params[:id])
            if contract.update(update_contract_params)
                render json: {status: "SUCCESS", message: "Updated Contract", data:contract},status: :ok
            else
                render json: {status: "ERROR", message: "Contract not updated", data:contract.errors},status: :unprocessable_entity
            end
        end

        private 
        def contract_params
            params.permit(:userAddress, :deployedAddress)
        end
        
        def update_contract_params
           params.permit(:userAddress) 
        end
    end
end