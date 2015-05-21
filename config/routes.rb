Rails.application.routes.draw do
  root 'courses#index'

  resources :students
  resources :courses do
    resources :classrooms do
      get :autocomplete_student_name, :on => :collection
    end
  end
end
