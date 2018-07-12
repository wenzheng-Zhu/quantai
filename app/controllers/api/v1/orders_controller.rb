module Api
	module V1
		class OrdersController < ApplicationController

			def index
				# @articles = Article.order('created_at DESC')
				# render json: { status: 'success', msg: 'loaded articles', data: @articles }, status: :ok

			end

			def show
				# @article = Article.find_by(id: params[:id])
				# render json: { status: 'success', msg: 'load article', data: @article }, status: :ok
			end

			def create
			#  	@article = Article.new(article_params)
			#  	if @article.save
			#  		render json: { status: 'success', msg: 'saved article', data: @article }, status: :ok
			#  	else
			#  		render json: { status: 'errors', msg: @article.errors }, status: :unprocessable_entity
			#  	end
                 phone_no = params[:entry][:field_2]
                 order_price = params[:entry][:total_price]
                 recent_order = Order.find_by(phone_no: phone_no).all("created_at DESC").first

                if  recent_order
                	if recent_order.total_point + order_price > 30
                		total_point = recent_order.total_point + order_price - 30 * ((recent_order.total_point + order_price)/30)
                	else
                		total_point = recent_order.total_point + order_price
                	end
                else
                	total_point = order_price
                end

                if recent_order
                	recent_order.bonus + ((recent_order.total_point + order_price)/30) * 5

                else
                	bonus = (order_price/30) * 5
                end

               @order =  Order.create(phone_no: phone_no, order_price: order_price, total_point: total_point, bonus: bonus)

                return render json: { data: @oder }, status: 200

			end


			def destroy
				# @article = Article.find_by(id: params[:id])
				# @article.destroy
				# render json: { status: 'success', msg: 'deleted article' }, status: :ok

			end


			def update
			# 	@article = Article.find_by(id: params[:id])
			# 	if @article.update_attributes(article_params)
				
			# 		render json: { status: 'success', msg: 'updated article', data: @article }, status: :ok
			# 	else
			# 		render json: { status: 'error', msg: 'updated failed' }, status: :unprocessable_entity
			# 	end
			# end

			#  private

			# def article_params
			#  	params.permit(:name, :body)
			 end



		end
	end
end