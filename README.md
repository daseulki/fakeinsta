그냥 만든 README

*** devise용 기록 ***
* [devise](https://github.com/plataformatec/devise/wiki/How-To:-Add-sign_in,-sign_out,-and-sign_up-links-to-your-layout-template)

gemfile 수정
``` ruby
gem 'devise'
```

젬파일 고치면 까먹지 말고 서버 끄고 번들 인스톨
```
 $ bundle install
 $ rails generate devise:install
```
--> VIEW 생성됨

application.html.erb 파일의 yield 위에 복붙
``` ruby
  <p class="notice"><%= notice %></p>
  <p class="alert"><%= alert %></p>
```
  --> flash 메세지를 보여주는 뷰


```
$ rails g devise user
$ rails generate devise MODEL
```
--> MODEL을 만든거라 migrate파일이 생김 (원하는대로 수정) --> db:migrate

controller에 복붙
``` ruby
before_action :authenticate_user!
```
원하는 액션 except 해줘도 됨

routes.rb 수정
``` ruby
devise_for :users, controllers: {
  session: 'users/sessions'
}

```


strong parameter 설정

ApplicationController
``` ruby
before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
 end
```


*** admin을 만들어보자 ***
우선 db에 column 하나만 추가하는 법 --> migration 파일을 하나 만들어서 추가하자
```
$ rails generate migration add_admin_to_users admin:boolean
$ rake db:migrate
```
콘솔창에서 직접 admin 생성하기 --> new 뷰에서는 관리자 생성 노노

```
$ rails generate migration add_admin_to_users admin:boolean

```

user_controller에 유저목록 확인하는 index 만들기 -> routes 파일 수정하기

``` ruby
  get '/users/index' => 'users#index'
```


다시 컨트롤러에 is_admin 액션 추가하고 필터 걸기!

before_action에 로그인확인과 관리자 확인해서 접속 가능하게 할 것

``` ruby

  def is_admin?
    redirect_to '/' and return unless current_user.admin?
  end


```
