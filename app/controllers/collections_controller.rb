class CollectionsController < ApplicationController

    before_action :get_collection_by_id, only: [:show, :update, :destroy]
    before_action :get_user
    before_action :require_owner, only: [:show, :update, :destroy]

    def index
        @cols = Collection.includes(:user).where(:user => @user)
        render "collections/index"
    end

    def show
        if @col
            render "collections/show"
        else
            render json: { errors: [ "Collection does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        Collection.transaction do
            @col = Collection.new(collection_params)
            @col.user_id = @user.id
            if @col.save
                CollectionEntity.update_collection_entities!(@col, entity_params[:entities])
                @col = Collection.find_by(id: @col.id)
                render "collections/show", status: :created
            else
                @errors = @col.errors
                render "errors/show", status: :unprocessable_entity
            end
        end
    end

    def update
        Collection.transaction do
            if @col.update(collection_params)
                if (entity_params[:entities] && entity_params[:entities].length > 0)
                    CollectionEntity.update_collection_entities!(@col, entity_params[:entities])
                    get_collection_by_id
                end
                render "collections/show"
            else
                @errors = @col.errors.full_messages
                render "errors/show", status: :unprocessable_entity
            end
        end
    end

    def destroy
        @col.destroy
        render "collections/show"
    end

    private

    def collection_params
        params
        .require(:collection)
        .permit(
            :title
        )
    end

    def entity_params
        params
        .require(:collection)
        .permit(
            {entities: [:id, :entity_type]}
        )
    end

    def get_collection_by_id
        @col = Collection.includes(:collection_entities).find_by(id: params[:id])
    end

    def get_user
        @user = User.find_by(id: current_user_id)
    end

    def require_owner
        render json: {error: 'Unauthorized'}, status: :unauthorized unless @user.id == @col.user.id
    end

end