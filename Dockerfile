FROM bizzotech/frappe:latest 
MAINTAINER Emad Shaaban <emad@bizzotech.com> 
 
ENV ERPNEXT_BRANCH v8.3.6 
 
USER $FRAPPE_USER 
WORKDIR /home/$FRAPPE_USER/frappe-bench 
RUN bench get-app erpnext https://github.com/frappe/erpnext --branch $ERPNEXT_BRANCH && \ 
    rm -rf /home/$FRAPPE_USER/frappe-bench/apps/erpnext/.git 
 
ENTRYPOINT ["docker-entrypoint.sh"] 
CMD ["app"] 
