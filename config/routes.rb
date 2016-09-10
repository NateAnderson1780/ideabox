Rails.application.routes.draw do
  get '/', to: "user#dashboard"
end
