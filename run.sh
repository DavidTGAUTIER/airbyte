docker run -it \
-v "$(pwd)/.aws:/home/plural/aws" \
-v "$(pwd)/.plural:/home/plural/.plural" \
-v "$(pwd)/.ssh:/home/plural/.ssh" \
-v "$(pwd):/home/plural/workspace" \
gcr.io/pluralsh/plural-cli:0.1.1-cloud zsh