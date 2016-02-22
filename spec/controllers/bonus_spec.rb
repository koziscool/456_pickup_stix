# require 'rails_helper'


# # ----------------------------------------
# # UsersController
# # ----------------------------------------

# describe UsersController do
#   let(:user) { create(:user) }
#   let(:followed) { create(:user) }
#   let(:following) { create(:following, :follower => user, :followed => followed) }


#   # ----------------------------------------
#   # GET #show
#   # ----------------------------------------

#   describe 'GET #show' do
#     let(:get_show) { get :show, :id => followed.id }


#     context 'the user IS logged in' do
#       before do
#         create_session(user)
#       end


#       context 'the current user has followed the user in the SHOW page' do
#         it 'sets an instance variable to the persisted following between the two users' do
#           following
#           get_show
#           expect(assigns[:following]).to be_an_instance_of(Following)
#           expect(assigns[:following]).to be_persisted
#           expect(assigns[:following].followed).to eq(followed)
#         end
#       end


#       context 'the current user has NOT followed the user in the SHOW page' do
#         it 'sets an instance variable to a new following between the two users' do
#           get_show
#           expect(assigns[:following]).to be_an_instance_of(Following)
#           expect(assigns[:following]).to_not be_persisted
#           expect(assigns[:following].followed).to eq(followed)
#         end
#       end
#     end


#     context 'the user is NOT logged in' do
#       it 'does not set an instance variable for a following even if one exists' do
#         following
#         get_show
#         expect(assigns[:following]).to be_nil
#       end
#     end
#   end
# end



# # ----------------------------------------
# # FollowingsController
# # ----------------------------------------


# describe FollowingsController do
#   let(:user) { create(:user) }
#   let(:followed) { create(:user) }
#   let(:following) { create(:following, :follower => user, :followed => followed) }


#   before do
#     set_http_referer
#   end

#   # ----------------------------------------
#   # POST #create
#   # ----------------------------------------

#   describe 'POST #create' do
#     let(:post_create_valid) do
#       post :create,
#         :followed_id => followed.id
#     end

#     let(:post_create_invalid) do
#       post :create,
#         :followed_id => 0
#     end


#     context 'the user is NOT logged in' do
#       it 'does not create the following' do
#         expect { post_create_valid }.to change(Following, :count).by(0)
#       end

#       it 'redirects to login' do
#         post_create_valid
#         expect(response).to redirect_to(login_path)
#       end
#     end


#     context 'the user IS logged in' do
#       context 'the data is valid' do
#         before do
#           create_session(user)
#         end


#         it 'creates the following' do
#           expect { post_create_valid }.to change(Following, :count).by(1)
#         end


#         it 'sets a success flash message' do
#           post_create_valid
#           expect(flash_success).to_not be_nil
#         end


#         it 'redirects back' do
#           post_create_valid
#           expect(response).to redirect_to(:back)
#         end
#       end


#       context 'the data is invalid' do
#         before do
#           create_session(user)
#         end

#         it 'does not create the following' do
#           expect { post_create_invalid }.to change(Following, :count).by(0)
#         end


#         it 'sets an error flash' do
#           post_create_invalid
#           expect(flash_error).to_not be_nil
#         end


#         it 'redirects to back' do
#           post_create_invalid
#           expect(response).to redirect_to(:back)
#         end
#       end
#     end
#   end

#   # ----------------------------------------
#   # DELETE #destroy
#   # ----------------------------------------

#   describe 'DELETE #destroy' do
#     let(:delete_destroy_valid) { delete :destroy, :id => following.id }
#     let(:delete_destroy_invalid) { delete :destroy, :id => 0 }


#     before do
#       following
#     end


#     context 'the user IS logged in' do
#       before do
#         create_session(user)
#       end

#       context 'when valid' do
#         it 'destroys the following' do
#           expect { delete_destroy_valid }.to change(Following, :count).by(-1)
#         end


#         it 'sets a success flash' do
#           delete_destroy_valid
#           expect(flash_success).to_not be_nil
#         end
#       end


#       context 'when invalid' do
#         it 'does NOT destroy the following' do
#           expect { delete_destroy_invalid }.to change(Following, :count).by(0)
#         end


#         it 'sets a error flash' do
#           delete_destroy_invalid
#           expect(flash_error).to_not be_nil
#         end
#       end
#     end


#     context 'the user is NOT logged in' do
#       it 'does NOT destroy the following' do
#         expect { delete_destroy_valid }.to change(Following, :count).by(0)
#       end


#       it 'redirects to login' do
#         delete_destroy_valid
#         expect(response).to redirect_to(login_path)
#       end


#       it 'sets an error flash' do
#         delete_destroy_valid
#         expect(flash_error).to_not be_nil
#       end
#     end
#   end
# end

