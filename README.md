# GlassCast

A simple weather forecasting application that provides you realtime weather for the selected city also it can predicte and provide the upcoming days forecast.

## Libraries & SDK's used
1. Supabase
2. OpenWeatherMap

## Setup
### Supabase Setup
1. Create supabase project
2. Copy Project URL and Anon Key from APIkeys section in the project settings later these key are requied to establish the communication to the app
3. On the left pane open SQL Editor and Create a table favourite cities using the below
``` 
create table if not exists favorite_cities (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users(id) on delete cascade,
    city_name text not null,
    lat double precision not null,
    lon double precision not null,
    created_at timestamp with time zone default now()
);
```
### Xcode Setup 
1. To make this project work in your local clone this project.
2. Create a new configuration setting file inside the project and rename it as Debug.xcconfig
3. Copy paste the Project URL and Anon Key from APIkeys section on the Supabase project settings and API key of OpenWeatherMap to Debug.xcconfig file.
   ```
   SUPABASE_URL = url
   SUPABASE_ANON_KEY = anon_key
   OPEN_WEATHER_API_KEY = api_key
   ```
4. Open project settings and click info under the project section(Not Target).
5. Uder Configuration expand the Debug dropdown and add Debug.xcconfig inside the debug drop down.
   
    <img width="697" height="517" alt="Image" src="https://github.com/user-attachments/assets/046467ce-3e7b-45f2-a033-65a4d83017e4" />
7. Create Property file(.plist) and add the properties below as below
   
    <img width="639" height="166" alt="Image" src="https://github.com/user-attachments/assets/e0311d4c-f8fd-47e3-bd5c-9ee358334822" />
8. Now your project is ready to run



