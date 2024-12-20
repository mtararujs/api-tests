FROM ubuntu:latest

WORKDIR /api-tests
RUN apt update
RUN apt install -y ruby-dev libffi-dev autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev libmysqlclient-dev
RUN gem install bundler
COPY Gemfile ./
RUN bundle install

COPY --from=ghcr.io/ufoscout/docker-compose-wait:latest /wait /wait

# dependencies: 
#     ``` bash
#     sudo apt update && apt install -y ruby-dev libffi-dev autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev libmysqlclient-dev
#     ```
    
#     2. Update ruby gem environment and install bundler for dependecy management:
#     ```bash
#      gem install bundler
#     ```
    
#     3. While being in the same directory where Gemfile is located to install all required depdendencies for those tests to run please execute command below:
#     ```bash
#     bundle install
#     ``` 
    
#     4. Run Tests
#     To run tests, execute for example:
#     ```bash
#     cucumber PLATFORM=DEV
#     ```