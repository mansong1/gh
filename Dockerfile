FROM redhat/ubi8-minimal:8.9-1029

LABEL name="mansong/gh" \
    maintainer="Martin Ansong <martin.ansong@proton.me>"

RUN microdnf update --nodocs --setopt=install_weak_deps=0 \
    && microdnf install --nodocs \
    yum-utils \
    && yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo \
    && microdnf install gh --nodocs \
    && microdnf remove yum-utils \
    && microdnf clean all \
    && rm -rf /var/cache/yum /var/cache/dnf

ENTRYPOINT ["gh"]
CMD [ "--help" ]