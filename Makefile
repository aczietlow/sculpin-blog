# Git credentials to be used by Travis.
GIT_USER = aczietlow
GIT_EMAIL = aczietlow@gmail.com

# This is the branch that should be considered production. (PLEASE DON'T TOUCH THIS)
GIT_PUBLISH_BRANCH = master

# This is the repository and branch to which the generated files will be pushed.
GIT_LIVE_URL = https://github.com/aczietlow/sculpin-blog.git
GIT_LIVE_BRANCH = gh-pages

# Build sculpin first, as that will generate the production code in case you want to
# see what that looks like.
build: compass_prod sculpin_prod

compass_prod: compass_clean
	# Build Sass/Compass - Tweak this to do CSS compression, too.
	bundle exec compass compile

compass_clean:
	bundle exec compass clean

sculpin_prod:
	# Build Sculpin itself
	bin/sculpin generate --env=prod

build_dev: compass_dev sculpin_dev

compass_dev: compass_clean
	bundle exec compass compile

sculpin_dev:
	# Build Sculpin itself
	bin/sculpin generate --env=dev


publish:
	# Tell GitHub that this is not a Jekyll project.
	touch output_prod/.nojekyll

	# Create a new repo for the build directory, then push that repo to live.
	# Because the first command changes the working directory we need to chain
	# all of them together into a single statement as far as the shell is concerned,
	# because each statement runs in its own shell instance.
	cd output_prod && \
	git init && \
	git config user.name '$(GIT_USER)' && \
	git config user.email '$(GIT_EMAIL)' && \
	git add . && \
	git commit -m 'Build website' && \
	git push "$(GIT_LIVE_URL)" -f master:$(GIT_LIVE_BRANCH)

# Clean up the directory structure.
clean: compass_clean
	rm -rf output_prod
	rm -rf output_dev

generate:
	# Generate sculpin on a local server
	bin/sculpin generate --server --watch
