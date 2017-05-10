FROM jetbrains/teamcity-server:latest

ENV         TEAMCITY_DATABASE_HOST=localhost
ENV         TEAMCITY_DATABASE_PORT=3306
ENV         TEAMCITY_DATABASE_USERNAME=teamcity
ENV         TEAMCITY_DATABASE_PASSWORD=teamcity
ENV         TEAMCITY_DATABASE_NAME=teamcity


# Copy adapters
COPY        ./jdbc/* /jdbc/

# Copy scripts
COPY        ./run-db-setup.sh /
ADD         https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /
RUN         chmod +x /wait-for-it.sh /run-db-setup.sh

# RUN!
CMD         /run-db-setup.sh && /run-services.sh