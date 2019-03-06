package auth

import (
	"log"

	"github.com/jinzhu/gorm"
	"github.com/satori/go.uuid"
)

func (model *User) BeforeCreate(scope *gorm.Scope) error {
	uuid, err := uuid.NewV4()

	if err != nil {
		log.Fatalf("uuid generation error: %v", err)
	}

	return scope.SetColumn("Id", uuid.String())
}
