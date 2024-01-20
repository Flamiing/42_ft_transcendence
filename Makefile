
DC_FILE_DEV := docker-compose.yml
DC := docker-compose -f $(DC_FILE_DEV)

COMMON_VOLUME := .docker-volume-mnt/commonlog_data
ELASTIC_VOLUME := .docker-volume-mnt/elastic_data
POSTGRES_VOLUME := .docker-volume-mnt/postgres_data
GRAFANA_VOLUME := .docker-volume-mnt/grafana_data
PROMETHEUS_VOLUME := .docker-volume-mnt/prometheus_data
NGINX_VOLUME := .docker-volume-mnt/nginx-logs-data
VOLUMES := $(COMMON_VOLUME) $(ELASTIC_VOLUME) $(POSTGRES_VOLUME) $(GRAFANA_VOLUME) $(PROMETHEUS_VOLUME) $(NGINX_VOLUME)

.PHONY: all clean fclean re restart

all: $(VOLUMES) 
	$(DC) up -d --build

clean:
	$(DC) down

fclean:
	$(DC) down --volumes --rmi local

re: clean all

restart: 
	$(DC) restart

# Volumes
$(POSTGRES_VOLUME): 
	mkdir -p $@ 
$(PROMETHEUS_VOLUME): 
	mkdir -p $@ 
$(GRAFANA_VOLUME): 
	mkdir -p $@ 
$(COMMON_VOLUME): 
	mkdir -p $@ 
$(ELASTIC_VOLUME): 
	mkdir -p $@ 
$(NGINX_VOLUME): 
	mkdir -p $@ 

