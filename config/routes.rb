Rails.application.routes.draw do
  devise_for :users
  root 'children#index'


  # Routes for the Photo_comment resource:
  # CREATE
  get('/photo_comments/new', { :controller => 'photo_comments', :action => 'new' })
  get('/create_photo_comment', { :controller => 'photo_comments', :action => 'create' })

  # READ
  get('/photo_comments', { :controller => 'photo_comments', :action => 'index' })
  get('/photo_comments/:id', { :controller => 'photo_comments', :action => 'show' })

  # UPDATE
  get('/photo_comments/:id/edit', { :controller => 'photo_comments', :action => 'edit' })
  get('/update_photo_comment/:id', { :controller => 'photo_comments', :action => 'update' })

  # DELETE
  get('/delete_photo_comment/:id', { :controller => 'photo_comments', :action => 'destroy' })
  #------------------------------

  # Routes for the Note resource:
  # CREATE
  get('/notes/new', { :controller => 'notes', :action => 'new' })
  get('/create_note', { :controller => 'notes', :action => 'create' })

  # READ
  get('/notes', { :controller => 'notes', :action => 'index' })
  get('/notes/:id', { :controller => 'notes', :action => 'show' })
  get('/children/:child_id/notes', { :controller => 'notes', :action => 'child_index' })

  # UPDATE
  get('/notes/:id/edit', { :controller => 'notes', :action => 'edit' })
  get('/update_note/:id', { :controller => 'notes', :action => 'update' })

  # DELETE
  get('/delete_note/:id', { :controller => 'notes', :action => 'destroy' })
  #------------------------------

  # Routes for the OwnPermission resource:
  # CREATE
  get('/own_permissions/new', { :controller => 'own_permissions', :action => 'new' })
  get('/create_own_permission', { :controller => 'own_permissions', :action => 'create' })

  # READ
  get('/own_permissions', { :controller => 'own_permissions', :action => 'index' })
  get('/own_permissions/:id', { :controller => 'own_permissions', :action => 'show' })

  # UPDATE
  # get('/own_permissions/:id/edit', { :controller => 'own_permissions', :action => 'edit' })
  # get('/update_own_permission/:id', { :controller => 'own_permissions', :action => 'update' })

  # DELETE
  get('/delete_own_permission/:id', { :controller => 'own_permissions', :action => 'destroy' })
  #------------------------------

  # Routes for the ViewPermission resource:
  # CREATE
  get('/view_permissions/new', { :controller => 'view_permissions', :action => 'new' })
  get('/create_view_permission', { :controller => 'view_permissions', :action => 'create' })

  # READ
  get('/view_permissions', { :controller => 'view_permissions', :action => 'index' })
  get('/view_permissions/:id', { :controller => 'view_permissions', :action => 'show' })

  # UPDATE
  # get('/view_permissions/:id/edit', { :controller => 'view_permissions', :action => 'edit' })
  # get('/update_view_permission/:id', { :controller => 'view_permissions', :action => 'update' })

  # DELETE
  get('/delete_view_permission/:id', { :controller => 'view_permissions', :action => 'destroy' })
  #------------------------------

  # Routes for the EditPermission resource:
  # CREATE
  get('/edit_permissions/new', { :controller => 'edit_permissions', :action => 'new' })
  get('/create_edit_permission', { :controller => 'edit_permissions', :action => 'create' })

  # READ
  get('/edit_permissions', { :controller => 'edit_permissions', :action => 'index' })
  get('/edit_permissions/:id', { :controller => 'edit_permissions', :action => 'show' })

  # UPDATE
  # get('/edit_permissions/:id/edit', { :controller => 'edit_permissions', :action => 'edit' })
  # get('/update_edit_permission/:id', { :controller => 'edit_permissions', :action => 'update' })

  # DELETE
  get('/delete_edit_permission/:id', { :controller => 'edit_permissions', :action => 'destroy' })
  #------------------------------

  # Routes for the Accomplishment resource:
  # CREATE
  get('/accomplishments/new', { :controller => 'accomplishments', :action => 'new' })
  get('/create_accomplishment', { :controller => 'accomplishments', :action => 'create' })

  # READ
  get('/accomplishments', { :controller => 'accomplishments', :action => 'index' })
  get('/accomplishments/:id', { :controller => 'accomplishments', :action => 'show' })
  get('/children/:child_id/accomplishments', { :controller => 'accomplishments', :action => 'child_index' })

  # UPDATE
  get('/accomplishments/:id/edit', { :controller => 'accomplishments', :action => 'edit' })
  get('/update_accomplishment/:id', { :controller => 'accomplishments', :action => 'update' })

  # DELETE
  get('/delete_accomplishment/:id', { :controller => 'accomplishments', :action => 'destroy' })
  #------------------------------

  # Routes for the Health resource:
  # CREATE
  get('/healths/new', { :controller => 'healths', :action => 'new' })
  get('/create_health', { :controller => 'healths', :action => 'create' })

  # READ
  get('/healths', { :controller => 'healths', :action => 'index' })
  get('/healths/:id', { :controller => 'healths', :action => 'show' })
  get('/children/:child_id/healths', { :controller => 'healths', :action => 'child_index' })

  # UPDATE
  get('/healths/:id/edit', { :controller => 'healths', :action => 'edit' })
  get('/update_health/:id', { :controller => 'healths', :action => 'update' })

  # DELETE
  get('/delete_health/:id', { :controller => 'healths', :action => 'destroy' })
  #------------------------------

  # Routes for the Bath resource:
  # CREATE
  get('/baths/new', { :controller => 'baths', :action => 'new' })
  get('/create_bath', { :controller => 'baths', :action => 'create' })

  # READ
  get('/baths', { :controller => 'baths', :action => 'index' })
  get('/baths/:id', { :controller => 'baths', :action => 'show' })
  get('/children/:child_id/baths', { :controller => 'baths', :action => 'child_index' })

  # UPDATE
  get('/baths/:id/edit', { :controller => 'baths', :action => 'edit' })
  get('/update_bath/:id', { :controller => 'baths', :action => 'update' })

  # DELETE
  get('/delete_bath/:id', { :controller => 'baths', :action => 'destroy' })
  #------------------------------

  # Routes for the Diaper resource:
  # CREATE
  get('/diapers/new', { :controller => 'diapers', :action => 'new' })
  get('/create_diaper', { :controller => 'diapers', :action => 'create' })

  # READ
  get('/diapers', { :controller => 'diapers', :action => 'index' })
  get('/diapers/:id', { :controller => 'diapers', :action => 'show' })
  get('/children/:child_id/diapers', { :controller => 'diapers', :action => 'child_index' })

  # UPDATE
  get('/diapers/:id/edit', { :controller => 'diapers', :action => 'edit' })
  get('/update_diaper/:id', { :controller => 'diapers', :action => 'update' })

  # DELETE
  get('/delete_diaper/:id', { :controller => 'diapers', :action => 'destroy' })
  #------------------------------

  # Routes for the Sleep resource:
  # CREATE
  get('/sleeps/new', { :controller => 'sleeps', :action => 'new' })
  get('/create_sleep', { :controller => 'sleeps', :action => 'create' })

  # READ
  get('/sleeps', { :controller => 'sleeps', :action => 'index' })
  get('/sleeps/:id', { :controller => 'sleeps', :action => 'show' })
  get('/children/:child_id/sleeps', { :controller => 'sleeps', :action => 'child_index' })

  # UPDATE
  get('/sleeps/:id/edit', { :controller => 'sleeps', :action => 'edit' })
  get('/update_sleep/:id', { :controller => 'sleeps', :action => 'update' })

  # DELETE
  get('/delete_sleep/:id', { :controller => 'sleeps', :action => 'destroy' })
  #------------------------------

  # Routes for the Food resource:
  # CREATE
  get('/foods/new', { :controller => 'foods', :action => 'new' })
  get('/create_food', { :controller => 'foods', :action => 'create' })

  # READ
  get('/foods', { :controller => 'foods', :action => 'index' })
  get('/foods/:id', { :controller => 'foods', :action => 'show' })
  get('/children/:child_id/foods', { :controller => 'foods', :action => 'child_index' })

  # UPDATE
  get('/foods/:id/edit', { :controller => 'foods', :action => 'edit' })
  get('/update_food/:id', { :controller => 'foods', :action => 'update' })

  # DELETE
  get('/delete_food/:id', { :controller => 'foods', :action => 'destroy' })
  #------------------------------

  # Routes for the Photo resource:
  # CREATE
  get('/photos/new', { :controller => 'photos', :action => 'new' })
  post('/create_photo', { :controller => 'photos', :action => 'create' })

  # READ
  get('/photos', { :controller => 'photos', :action => 'index' })
  get('/photos/:id', { :controller => 'photos', :action => 'show' })
  get('/children/:child_id/photos', { :controller => 'photos', :action => 'child_index' })

  # UPDATE
  get('/photos/:id/edit', { :controller => 'photos', :action => 'edit' })
  get('/update_photo/:id', { :controller => 'photos', :action => 'update' })

  # DELETE
  get('/delete_photo/:id', { :controller => 'photos', :action => 'destroy' })
  #------------------------------

  # Routes for the Child resource:
  # CREATE
  get('/children/new', { :controller => 'children', :action => 'new' })
  get('/create_child', { :controller => 'children', :action => 'create' })

  # READ
  get('/children', { :controller => 'children', :action => 'index' })
  get('/children/:id', { :controller => 'children', :action => 'show' })
  get('/children/:id/dayview/:date', { :controller => 'children', :action => 'dayview' })
  get('/datepick', { :controller => 'children', :action => 'datepick' })

  # UPDATE
  get('/children/:id/edit', { :controller => 'children', :action => 'edit' })
  get('/update_child/:id', { :controller => 'children', :action => 'update' })

  # DELETE
  get('/delete_child/:id', { :controller => 'children', :action => 'destroy' })
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
