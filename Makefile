#!make
mainShell=bash
mainService=backend

define default
$(if $(1),$(1),$(2))
endef

up:
	@$(shell touch .backend/bash_history)
	@docker-compose up -d ${options}

down:
	@docker-compose down

status:
	@docker-compose ps

shell:
	@docker-compose exec $(call default,${service},${mainService}) $(call default,${run},${mainShell})

logs:
	@docker-compose logs ${service}