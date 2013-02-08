class ItemstablesController < ApplicationController
 respond_to :html, :json

  def index
  #  @itemstables = if params[:request]
      #fields = if params[:fields] == "all_columns"
      #  %w(login_name first_name last_name role)
      #else
      #  params[:fields] 
     # end
     # itemstable.send params[:scope].intern, fields, params[:request]
  #  else
   #   itemstable.scoped
   # end

   # @itemstables = @itemstables.reorder(params[:itemstableBy]).page(params[:currentPage]).per(params[:perPage])

   # @pagination = {
      #current_page: @itemstables.current_page,
      #num_pages:    @itemstables.num_pages,
     # per_page:     @itemstables.limit_value,
     # total_count:  itemstable.count,
   # }
    @itemstables = Itemstable.all
    
    respond_to do |format|
      format.html
      format.json do
        respond_with({ models: @itemstables })#}.merge @pagination)
      end
    end
  end

  def show
    @itemstable = Itemstable.find(params[:id])       
    @order = Order.find(@itemstable.order_id)
    
    @all_items = @order.items.select("item_id,item_name,item_description,dimension,price,quantity,price_per_line")
    
    respond_to do |format|
      format.html # show.html.erb      
      format.json { render json: @all_items }
      #format.json { render json: { itemstable: @itemstable, itemstable_items: @all_items.to_json().html_safe } }
    end
  end

  def create
    @itemstable = Itemstable.create params[:itemstable]
    respond_to do |format|
      format.html { redirect_to itemstable_path(@itemstable) }
      format.json { respond_with @itemstable }
    end
  end

  def update
    @itemstable = Itemstable.find params[:id]
    @itemstable.update_attributes params[:itemstable]
    respond_to do |format|
      format.html
      format.json { respond_with @itemstable }
    end
  end

  def destroy
    respond_with Itemstable.destroy(params[:id])
  end

end 
