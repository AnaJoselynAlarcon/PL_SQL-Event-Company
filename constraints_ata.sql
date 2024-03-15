ALTER TABLE ata_agent
  ADD CONSTRAINT pk_ata_agent PRIMARY KEY(agent_id);

ALTER TABLE ata_client
  ADD CONSTRAINT pk_ata_client PRIMARY KEY(client_id)
  ADD CONSTRAINT fk_ata_cl_to_ag FOREIGN KEY(agent_id)
      REFERENCES ata_agent(agent_id);

ALTER TABLE ata_entertainer
  ADD CONSTRAINT pk_ata_entertainer PRIMARY KEY(entertainer_id)
  ADD CONSTRAINT fk_ata_en_to_ag FOREIGN KEY(agent_id)
      REFERENCES ata_agent(agent_id);

ALTER TABLE ata_contract
  ADD CONSTRAINT pk_ata_contract PRIMARY KEY(contract_number)
  ADD CONSTRAINT fk_ata_co_to_cl FOREIGN KEY(client_id)
      REFERENCES ata_client(client_id)
  ADD CONSTRAINT fk_ata_co_to_en FOREIGN KEY (entertainer_id)
      REFERENCES ata_entertainer(entertainer_id);

ALTER TABLE ata_performance
  ADD CONSTRAINT pk_ata_performance PRIMARY KEY(contract_number, performance_date)
  ADD CONSTRAINT fk_ata_pe_to_co FOREIGN KEY(contract_number)
      REFERENCES ata_contract(contract_number);

ALTER TABLE ata_musical_style
  ADD CONSTRAINT pk_ata_musical_style PRIMARY KEY(style_code);

ALTER TABLE ata_entertainers_style
  ADD CONSTRAINT pk_ata_entertainers_style PRIMARY KEY(entertainer_id, style_code)
  ADD CONSTRAINT fk_ata_es_to_en FOREIGN KEY(entertainer_id)
      REFERENCES ata_entertainer(entertainer_id)
  ADD CONSTRAINT fk_ata_es_to_mus FOREIGN KEY(style_code)
      REFERENCES ata_musical_style(style_code);



