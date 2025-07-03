# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Conversation Guidelines

- 常に日本語で会話する

## Project Overview

This is a Japanese Rails 7.1 application called "Emotional Record" - a stress relief platform that helps users (primarily middle-aged working professionals) express their feelings through 2-minute writing sessions based on expressive writing therapy. The app includes user authentication, emotional tracking with likes functionality, and uses Docker for containerization.

**Key Technologies:**

- Ruby 3.4.2, Rails 7.1.5
- MySQL 8.4 (production), SQLite3 (development/test)
- Hotwire (Turbo + Stimulus)
- TailwindCSS 4.1 with DaisyUI 5.0
- Docker with nginx
- ESBuild for JavaScript bundling

## Architecture

**Core Models:**

- `User`: Authentication with bcrypt, has many posts and likes
- `Post`: Main content model with emotion enum (neutral, happy, sad, angry, excited), emotion_rating (1-5), belongs to user and topic
- `Topic`: Categorization for posts
- `Like`: Many-to-many relationship between users and posts

**Key Features:**

- Session-based authentication (not Devise)
- Emotion tracking with 5 emotion types and ratings
- Real-time likes with Turbo Streams
- Japanese UI and comments throughout codebase

## Development Commands

**Setup and Installation:**

```bash
# Setup (run once)
bin/setup

# Start development servers (recommended)
bin/dev  # Runs Procfile.dev - starts Rails, CSS watch, and JS watch

# Alternative: start individual services
bin/rails server -p 3000 -b 0.0.0.0
npm run watch:css
npm run build -- --watch
```

**Database:**

```bash
# Setup database
bin/rails db:create db:migrate db:seed

# Reset database
bin/rails db:drop db:create db:migrate db:seed

# Run migrations
bin/rails db:migrate
```

**Testing:**

```bash
# Run all tests (uses Minitest, not RSpec)
bin/rails test

# Run specific test file
bin/rails test test/models/user_test.rb

# Run system tests
bin/rails test:system
```

**Asset Management:**

```bash
# Build CSS (TailwindCSS)
npm run build:css

# Watch CSS changes
npm run watch:css

# Build JavaScript (ESBuild)
npm run build
```

**Code Quality:**

```bash
# Ruby linting
bin/rubocop

# Auto-fix Ruby issues
bin/rubocop -A

# ERB linting
bundle exec erblint --lint-all

# Format code
bundle exec prettier --write '**/*.{js,erb,html}'
```

## Docker Development

**Start with Docker:**

```bash
# Development
docker-compose up

# Production
docker-compose -f docker-compose.prod.yml up
```

## Code Conventions

**Ruby/Rails:**

- Frozen string literals required (`# frozen_string_literal: true`)
- Double quotes for strings (RuboCop enforced)
- 2-space indentation
- Extensive Japanese comments explaining functionality
- Strong focus on code readability with descriptive variable names

**Frontend:**

- TailwindCSS with DaisyUI components
- Stimulus controllers for interactivity
- Turbo Streams for real-time updates (likes functionality)
- ESBuild for bundling instead of traditional Rails asset pipeline

**Database:**

- MySQL charset: utf8mb4 with utf8mb4_0900_ai_ci collation
- Foreign key constraints properly defined
- Unique indexes on user-post relationships for likes

## Key Files and Locations

**Models:** `app/models/` - Core business logic with detailed Japanese comments
**Controllers:** `app/controllers/` - RESTful controllers with nested likes routes
**Views:** `app/views/` - ERB templates with TailwindCSS/DaisyUI styling
**Routes:** `config/routes.rb` - Nested resources for posts/likes, custom auth routes
**Database:** `db/schema.rb` - Current schema, `db/migrate/` - migrations
**Assets:** `app/assets/builds/` - Compiled assets, `app/javascript/` - source JS
**Tests:** `test/` - Minitest test suite with fixtures

## Important Notes

- The application has comprehensive Japanese documentation in comments
- Uses session-based authentication, not token-based
- Emotion enum values: neutral(0), happy(1), sad(2), angry(3), excited(4)
- Like functionality uses Turbo Streams for real-time updates
- Development uses SQLite3, production uses MySQL
- Code style is strictly enforced with RuboCop and ERB-lint configurations
