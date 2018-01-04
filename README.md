그냥 만든 README

devise용 기록
* [devise](https://github.com/plataformatec/devise/wiki/How-To:-Add-sign_in,-sign_out,-and-sign_up-links-to-your-layout-template)

gemfile 수정
gem 'devise'

서버 끄고 $ bundle install

$ rails generate devise:install
--> VIEW

application.html.erb 파일의 yield 위에 복붙
  <p class="notice"><%= notice %></p>
  <p class="alert"><%= alert %></p>
  --> flash 메세지를 보여주는 뷰

$ rails g devise user
--> rails generate devise MODEL
--> MODEL을 만든거라 migrate파일이 생김
--> $ rails db:migrate 해야됨


controller에 복붙
before_action :authenticate_user!
원하는 액션 except 해줘도 됨
