ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :title, :body

	filter :tags

	controller do

	  def create
	  	@post = Post.new({ title: params[:post][:title], body: params[:post][:body] })
	    @post.admin_users_id = current_admin_user.id
	    @post.tag_list.add(params[:post][:tag_list])
	    super
	  end

	  def update
	  	@post = Post.find(params[:id])
	  	@post.update_attributes({ title: params[:post][:title], body: params[:post][:body] })
	    @post.tag_list.add(params[:post][:tag_list])
	    super
	  end

	  def autocomplete_tags
	    @tags = ActsAsTaggableOn::Tag.
	      where("name LIKE ?", "#{params[:q][:term]}%").
	      order(:name)
	    tags = @tags.map{|poo| {id: poo.name, name:poo.name }} 
	    respond_to do |format|
	      format.json { render json: tags }
	    end
	  end
	end


	form do |f|
	  f.inputs do
	    f.input :title
	    f.input :body
	    f.input :tag_list, :as => :select,
	      label: "Tags",
	      multiple: true,
	      input_html: {
	        data: {
	          placeholder: "Enter Tags",
	          saved: f.object.tags.map{|t| {id: t.name, name: t.name}}.to_json,
	          url: autocomplete_tags_path },
	        class: 'tagselect'
	      }
	  end
	  f.actions
	end

end
