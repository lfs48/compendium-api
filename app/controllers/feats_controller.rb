class FeatsController < ApplicationController

    before_action :get_feat_by_id, only: [:show, :update, :destroy]
    before_action :require_gm, only: [:create, :update, :destroy]

    def index
        @feats = Feat.all
        render "feats/index"
    end

    def show
        if @feat
            render "feats/show"
        else
            render json: { errors: [ "Feat does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        @feat = Feat.new(feat_params)
        if @feat.save
            render "feats/show", status: :created
        else
            @errors = @feat.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @feat.update(feat_params)
            render "feats/show"
        else
            @errors = @feat.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy
        @feat.destroy
        render "feats/show"
    end

    private

    def feat_params
        params
        .require(:feat)
        .permit(
            :name, 
            :description, 
            :dnd_class_id
        )
    end

    def get_feat_by_id
        @feat = Feat.find_by(id: params[:id])
    end

end