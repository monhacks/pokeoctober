DoAnimFrame:
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to SPRITE_ANIM_SEQ_* constants
	dw .Null
	dw .PartyMon
	dw .PartyMonSwitch
	dw .PartyMonSelected
	dw .GSTitleTrail
	dw .NamingScreenCursor
	dw .GameFreakLogo
	dw .GSIntroStar
	dw .GSIntroSparkle
	dw .SlotsGolem
	dw .SlotsChansey
	dw .SlotsChanseyEgg
	dw .MailCursor
	dw .UnusedCursor
	dw .DummyGameCursor
	dw .PokegearArrow
	dw .TradePokeBall
	dw .TradeTubeBulge
	dw .TrademonInTube
	dw .RevealNewMon
	dw .RadioTuningKnob
	dw .CutLeaves
	dw .FlyFrom
	dw .FlyLeaf
	dw .FlyTo
	dw .GSIntroHoOh
	dw .EZChatCursor
	dw .MobileTradeSentPulse
	dw .MobileTradeOTPulse
	dw .GSIntroBubble
	dw .GSIntroShellder
	dw .Celebi
	dw .GSIntroMagikarp
	dw .UnusedIntroAerodactyl
	dw .GSIntroLapras
	dw .GSIntroNote
	dw .GSIntroJigglypuff
	dw .GSIntroPikachu
	dw .GSIntroPikachuTail
	dw .GSIntroFireball
	dw .GSIntroChikoritaTotodile
	dw .GSIntroCyndaquil
	dw .SW97TitleParticles

.Null:
	ret

.PartyMon
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .PartyMonSwitch

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0
	ret

.PartyMonSwitch
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld e, [hl]

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	and $10 ; bit 4
	jr z, .load_zero
	ld a, e
	and a
	jr z, .load_minus_two
	cp $1
	jr z, .load_minus_one
.load_zero
	xor a
	ld [hl], a
	ret

.load_minus_one
	ld a, -1
	ld [hl], a
	ret

.load_minus_two
	ld a, -2
	ld [hl], a
	ret

.PartyMonSelected
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .three_offset_right

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2
	ret

.three_offset_right
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3
	ret

.GSTitleTrail
	call .AnonymousJumptable
	jp hl

; Anonymous dw (see .AnonymousJumptable)
	dw .four_zero
	dw .four_one

.four_zero
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a

.four_one
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .asm_8d356

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	add $4

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	sla a
	sla a
	ld d, $2

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add $3
	ld [hl], a
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8d356
	call DeinitializeSprite
	ret

.GSIntroHoOh
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, $2
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.NamingScreenCursor
	callfar NamingScreen_AnimateCursor
	ret

.MailCursor
	callfar ComposeMail_AnimateCursor
	ret

.GameFreakLogo:
	callfar GameFreakPresents_UpdateLogoPal
	ret

.GSIntroStar
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d3ba

	dec [hl]
	dec [hl]
	ld d, a
	and $1f
	jr nz, .asm_8d395

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	dec [hl]
.asm_8d395
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.asm_8d3ba
	ld a, $1
	ld [wcf64], a
	call DeinitializeSprite
	ret

.GSIntroSparkle
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_8d41e

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -$10
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	ret

.asm_8d41e
	call DeinitializeSprite
	ret

.SlotsGolem:
	callfar Slots_AnimateGolem
	ret

.SlotsChansey:
	callfar Slots_AnimateChansey
	ld hl, wcf64
	ld a, [hl]
	cp $2
	ret nz
	ld [hl], $3
	ld a, SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY_2
	call _ReinitSpriteAnimFrame
	ret

.SlotsChanseyEgg:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and $1
	jr z, .move_vertical

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp 15 * 8
	jr c, .move_right
	call DeinitializeSprite
	ld a, $4
	ld [wcf64], a
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ret

.move_right
	inc [hl]
.move_vertical
	ld a, e
	ld d, $20
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.UnusedCursor
	callfar ret_e00ed
	ret

.PokegearArrow
	callfar AnimatePokegearModeIndicatorArrow
	ret

.DummyGameCursor
	;callfar DummyGame_InterpretJoypad_AnimateCursor
	ret

.TradePokeBall
	call .AnonymousJumptable
	jp hl

; Anonymous dw (see .AnonymousJumptable)
	dw .TradePokeBall_zero
	dw .TradePokeBall_one
	dw .TradePokeBall_two
	dw .TradePokeBall_three
	dw .TradePokeBall_four
	dw .TradePokeBall_five

.TradePokeBall_zero
	ld a, SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL_WOBBLE
	call _ReinitSpriteAnimFrame

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $2

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $20
	ret

.TradePokeBall_two
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d4af
	dec [hl]
	ret

.asm_8d4af
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $40

.TradePokeBall_three
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_8d4cd
	dec [hl]
	ld d, $28
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8d4cd
	ld de, SFX_GOT_SAFARI_BALLS
	call PlaySFX
	jr .TradePokeBall_five

.TradePokeBall_one
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $4

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $24
	ret

.TradePokeBall_four
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d51c
	ld d, a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	call Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $20

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	sub $c
	ld [hl], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

.asm_8d51c
	xor a

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call .IncrementJumptableIndex
	ret

.TradePokeBall_five
	call DeinitializeSprite
	ret

.TradeTubeBulge
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	cp $b0
	jr nc, .delete
	and $3
	ret nz
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

.delete
	call DeinitializeSprite
	ret

.TrademonInTube
	callfar TradeAnim_AnimateTrademonInTube
	ret

.RevealNewMon:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .finish_EggShell
	ld d, a
	add $8
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a

	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.finish_EggShell
	call DeinitializeSprite
	ret

.RadioTuningKnob:
	callfar AnimateTuningKnob
	ret

.CutLeaves
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.FlyFrom:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and a
	ret z

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	dec [hl]

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .skip
	add $8
	ld [hl], a
.skip
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.FlyLeaf:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp -9 * 8
	jr nc, .delete_leaf
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]

	ld d, $40
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.delete_leaf
	call DeinitializeSprite
	ret

.FlyTo:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 10 * 8 + 4
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .asm_8d621
	sub $2
	ld [hl], a
.asm_8d621
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.MobileTradeSentPulse
	ld a, [wcf64]
	and a
	ret z
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp -1 * 8 - 6
	jr z, .delete_s
	sub 1 * 8
	ld [hl], a
	ret
.delete_s
	farcall DeinitializeSprite
	ret

.MobileTradeOTPulse
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 9 * 8 + 2
	ret z
	add 1 * 8
	ld [hl], a
	ret

.GSIntroBubble:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	jr nc, .delete__9f3b

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add 2
	ld [hl], a
	ld d, 8
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.delete__9f3b
	call DeinitializeSprite
	ret

.GSIntroShellder:
	ld a, [wGlobalAnimYOffset]
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	cp $b0
	ret c
	call DeinitializeSprite
	ret

.GSIntroMagikarp:
	call .AnonymousJumptable
	jp hl
.anon_dw__aef4
	dw .zero__aef4
	dw .one__aef4

.zero__aef4
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [hl]

	and $3
	swap a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a

.one__aef4
	lb de, 2, 1
	ldh a, [hSGB]
	and a
	jr z, .sgb__aef4
	lb de, 4, 2
.sgb__aef4
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp $f0
	jr nc, .delete__aef4

	add d
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ld d, 8
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.delete__aef4
	call DeinitializeSprite
	ret

.UnusedIntroAerodactyl:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b0
	jr nc, .delete__c1d1

	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $1
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	ret

.delete__c1d1
	call DeinitializeSprite
	ret

.GSIntroLapras:
	call .AnonymousJumptable
	jp hl
.anon_dw__16e4
	dw .zero__16e4
	dw .one__16e4
	dw .two__16e4

.zero__16e4
	call .update_y_offset__16e4
	ret z

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $58
	jr c, .next1__16e4

	dec [hl]
	ret

.next1__16e4
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $d0
	ret

.one__16e4
	call .update_y_offset__16e4
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next2__16e4

	dec [hl]
	ret

.next2__16e4
	call .IncrementJumptableIndex
	ret

.two__16e4
	call .update_y_offset__16e4
	ret z
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .delete__16e4
	dec [hl]
	ret

.delete__16e4
	call DeinitializeSprite
	ld a, TRUE
	ld [wIntroSpriteStateFlag], a
	ret

.update_y_offset__16e4
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, 4
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and $1
	ret

.GSIntroNote:
	call .AnonymousJumptable
	jp hl
.anon_dw__cce6
	dw .zero__cce6
	dw .one__cce6

.zero__cce6
	call .IncrementJumptableIndex
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and $1
	swap a
	sla a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a

.one__cce6
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .delete__cce6
	inc [hl]

	ld d, 4
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add 2
	ld [hl], a
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	and $2
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.delete__cce6
	call DeinitializeSprite
	ret

.GSIntroJigglypuff:
	call .AnonymousJumptable
	jp hl
.anon_dw__d784
	dw .zero__d784
	dw .one__d784

.zero__d784
	ld a, [wIntroSpriteStateFlag]
	and a
	ret z
	call .IncrementJumptableIndex
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_JIGGLYPUFF_2
	call _ReinitSpriteAnimFrame

.one__d784
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .delete__d784
	dec [hl]
	dec [hl]
	ret

.delete__d784
	call DeinitializeSprite
	ret

.GSIntroPikachu:
	call .AnonymousJumptable
	jp hl
.anon_dw__5427
	dw .zero__5427
	dw .one__5427
	dw .two__5427
	dw .three__5427

.zero__5427
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .next1__5427
	dec [hl]
	ret

.next1__5427
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_2
	call _ReinitSpriteAnimFrame
	ret

.one__5427
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next2__5427
	dec [hl]
	ret

.next2__5427
	call .IncrementJumptableIndex
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_3
	call _ReinitSpriteAnimFrame
	ret

.two__5427
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	ld d, 4
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $50
	jr z, .next3__5427
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.next3__5427
	ld a, TRUE
	ld [wIntroSpriteStateFlag], a
	call .IncrementJumptableIndex
	ret

.three__5427
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .delete__5427
	dec [hl]
	dec [hl]
	ret

.delete__5427
	call DeinitializeSprite
	ret

.GSIntroPikachuTail:
	call .AnonymousJumptable
	jp hl
.anon_dw__3a45
	dw .zero__3a45
	dw .one__3a45
	dw .two__3a45

.zero__3a45
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .next1__3a45
	dec [hl]
	ret

.next1__3a45
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_TAIL_2
	call _ReinitSpriteAnimFrame
	ret

.one__3a45
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next2__3a45
	dec [hl]
	cp $20
	ret nz
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_TAIL
	call _ReinitSpriteAnimFrame
	ret

.next2__3a45
	call .IncrementJumptableIndex
	ret

.two__3a45
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	ld d, 4
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .delete__3a45
	dec [hl]
	dec [hl]
	ld a, [wIntroSpriteStateFlag]
	and a
	ret nz
	dec [hl]
	dec [hl]
	ret

.delete__3a45
	call DeinitializeSprite
	ret

.GSIntroFireball:
	call .AnonymousJumptable
	jp hl
.anon_dw__ac52
	dw .zero__ac52
	dw .one__ac52

.zero__ac52
	call .IncrementJumptableIndex
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and $4
	sla a
	ld e, a
	ld a, [hl]
	and $3
	swap a
	add e
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a
	ret

.one__ac52
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	ld d, a
	add 8
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.GSIntroChikoritaTotodile:
	call .AnonymousJumptable
	jp hl
.anon_dw__d01c
	dw .zero__d01c
	dw .one__d01c

.zero__d01c
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ret

.one__d01c
; flash down/right
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $3c
	ret nc

	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.GSIntroCyndaquil:
	call .AnonymousJumptable
	jp hl
.anon_dw__86e4
	dw .zero__86e4
	dw .one__86e4

.zero__86e4
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $10
	ret

.one__86e4
; flash down/left
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $3c
	ret nc
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Cosine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.SW97TitleParticles
	call .AnonymousJumptable
	jp hl
; anonymous jumptable
	dw .SW97TitleParticles_1
	dw .SW97TitleParticles_2

.SW97TitleParticles_1
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	and %11
	ld [hl], a
	inc [hl]
	swap a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a

.SW97TitleParticles_2
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	sub [hl]
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	sla a
	sla a
	ld d, a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add a, 2
	ld [hl], a
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.EZChatCursor
	ret

.Celebi
	farcall UpdateCelebiPosition
	ret

.AnonymousJumptable:
	ld hl, sp+$0
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.IncrementJumptableIndex:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

.Sprites_Sine:
	call Sprites_Sine
	ret

.Sprites_Cosine:
	call Sprites_Cosine
	ret
