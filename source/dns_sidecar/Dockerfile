FROM mcr.microsoft.com/azure-cli AS base

ENV ENTRYPOINT_FILE="entrypoint.sh"
ARG USERNAME="appuser"

RUN adduser -Dg "" "${USERNAME}"

WORKDIR "/home/${USERNAME}"
COPY ${ENTRYPOINT_FILE} .

RUN chown "${USERNAME}" "${ENTRYPOINT_FILE}" \
    && chmod u+x "${ENTRYPOINT_FILE}"

USER ${USERNAME}
CMD "./${ENTRYPOINT_FILE}"
