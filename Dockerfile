FROM docker:stable-git as docker

ENV DOCKER_HOST=SOME_HOST
ENV GITHUB_TOKEN=SOME_TOKEN

RUN apk add --update nodejs npm curl bash openssl

RUN npm install -g semantic-release               \
        @semantic-release/changelog               \
        @semantic-release/commit-analyzer         \
        @semantic-release/exec                    \
        @semantic-release/git                     \
        @semantic-release/release-notes-generator

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN /get_helm.sh
