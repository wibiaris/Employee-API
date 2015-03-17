module Employee
	class Data < Grape::API

		resource :employee_data do 

			desc "List all Employee"
			get do
				EmpData.all
			end

			desc "create a new eployee"
			## This takes care of paramater validation
			params do
				requires :name, type: String
				requires :address, type: String
				requires :age, type: String
			end

			post do
				EmpData.create!({
					name:params[:name],
					address:params[:address],
					age:params[:age]
					})
			end

			desc "delete an employee"
			params do
				requires :id, type: String
			end
			delete ':id' do
				EmpData.find(params[:id]).destroy!
			end

			desc "update an employee address"
			params do
				requires :id, type: String
				requires :address, type: String
			end

			put ':id' do
				EmpData.find(params[:id]).update({
					adress:params[:adress]
					})
			end


		end

	end

end