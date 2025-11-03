# Use Cypress Docker image with Node.js and Chrome
FROM cypress/included:13.15.0

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Install Allure commandline
RUN npm install -g allure-commandline

# Copy the entire project
COPY . .

# Make sure cypress/tests directory has proper permissions
RUN chmod -R 755 cypress/

# Set environment variables
ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress
ENV DISPLAY=:99

# Create directories for reports
RUN mkdir -p allure-results allure-report

# Default command to run tests in Chrome (can be overridden)
CMD ["npx", "cypress", "run", "--browser", "chrome", "--spec", "cypress/tests/smoke/*.cy.js"]