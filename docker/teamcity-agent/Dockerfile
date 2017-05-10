FROM jetbrains/teamcity-minimal-agent

RUN apt-get update

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Install useful NodeJS packages
RUN npm install -g gulp grunt-cli bower typings

# Install PHP cli
RUN apt-get update && apt-get install -y \
    php5-cli php5-mysql php5-imagick

# Install additional utilities
RUN apt-get update && apt-get install -y \
    imagemagick optipng

RUN rm -rf /var/lib/apt/lists/*