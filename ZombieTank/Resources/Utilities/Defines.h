//
//  Defines.h
//  ZombieTank
//
//  Created by Rafal Kampa on 12.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

static const CGFloat baseCenterX = 479;
static const CGFloat baseCenterY = 355;

static const uint32_t sprite1Category = 0x1 << 0;
static const uint32_t sprite2Category = 0x1 << 1;
static const uint32_t sprite3Category = 0x1 << 6;
static const uint32_t spriteDissapearCategory = 0x1 << 5;

//spriteNames

static NSString *const spriteNameTankBody = @"tankBody";
static NSString *const spriteNameTankRifle = @"tankRifle";
static NSString *const spriteNameLabelEndingWave = @"labelEndingWave";
static NSString *const spriteNameBang = @"bang";

static NSString *const spriteNameEnemyZombie = @"zombie";
static NSString *const spriteNameEnemyGhost = @"ghost";
static NSString *const spriteNameEnemyNotMoving = @"notMovingEnemy";
static NSString *const spriteNameEnemyfireBall = @"fireBall";

//stages

static NSString *const stageNameStageOne = @"StageOne";
static NSString *const stageNameStageTwo = @"StageTwo";
static NSString *const stageNameStageThree = @"StageThree";
static NSString *const stageNameStageFour = @"StageFour";
static NSString *const stageNameStageFive = @"StageFive";



//spawnPlaces

static NSString *const spawnStageOne = @"SpawnStageOne";
static NSString *const spawnStageTwo = @"SpawnStageTwo";
static NSString *const spawnStageThree = @"SpawnStageThree";
static NSString *const spawnStageFour = @"SpawnStageFour";
static NSString *const spawnStageFive = @"SpawnStageFive";



static NSString *const userDefaultsAvaiableSkins = @"avaiableSkins";
static NSString *const userDefaultsSelectedTankSkin = @"selectedTankSkin";
static NSString *const userDefaultsUnlockedLevel = @"unlockedLevel";

//segue

static NSString *const segueGoToMainScene = @"goToMainScene";
static NSString *const segueGoToMonsterInfo = @"show_popover_info_monster";
