package main

import (
	"fmt"

	"github.com/Open-Source-Life/AxolotlDrive/cmd/api"
	"github.com/Open-Source-Life/AxolotlDrive/config"
	"github.com/Open-Source-Life/AxolotlDrive/db"
	"github.com/Open-Source-Life/AxolotlDrive/logger"
	"github.com/rs/zerolog/log"
)

func main() {

	config := config.NewConfig()

	logger.Init(config.APPEnv == "development" || config.LOGLevel == "debug")
	log.Info().Msg("Logger has been initialized properly")
	log.Debug().Msg("Debug Mode is set to true")

	log.Debug().Msg("Trying to connect to database")
	db := db.NewPostgresInstance(
		config.DBHost,
		config.DBPort,
		config.DBUser,
		config.DBPass,
		config.DBName,
	)
	log.Info().Msg("Database connection established successfully")
	dbInstance := db.GetDB()

	log.Debug().Msgf("Initial stuff done now moving to API")

	apiServer := api.NewAPIServer(fmt.Sprintf(":%d", config.APPPort), dbInstance)

	log.Debug().Msg("Trying to start API server in main.go")

	if err := apiServer.Start(); err != nil {
		log.Fatal().Err(err).Msg("Failed to start API server")
	}

}
