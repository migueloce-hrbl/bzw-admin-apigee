# bundle the apigee proxy
FROM joshkeegan/zip:3.17.3 AS build
WORKDIR /apigee
COPY src .
RUN zip -r src.zip src
RUN ls -lR

## build local apigee emulator

FROM google/apigee-emulator:1.9.1 AS base
WORKDIR /opt/apigee

# copy the apigee proxy bundel to base
COPY --from=build /apigee/src.zip .

# create new entry sh.
RUN sed '$d' emulator-entry.sh > emulator-entry-new.sh 
# wait for 30 sec to bring the apigee controller to initilize
RUN echo 'sleep 30' >> emulator-entry-new.sh 
# to deploy the apigee proxies 
RUN echo 'curl -v http://localhost:8080/v1/emulator/deploy?environment=local -H "Content-Type: zip" --data-binary "@src.zip"' >> emulator-entry-new.sh 
# to keep alive
RUN echo 'wait "$MKPID"' >> emulator-entry-new.sh 
# replace the old entry sh with new 
RUN rm emulator-entry.sh
RUN mv emulator-entry-new.sh emulator-entry.sh
# set exec permission for the entry sh
RUN chmod +x emulator-entry.sh
