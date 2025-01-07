package com.example.solo_play_web_server.course.service

import com.example.solo_play_web_server.course.dtos.PalaceRequestDto
import com.example.solo_play_web_server.course.dtos.PalaceResponseDto
import com.example.solo_play_web_server.course.repository.PalaceRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class PalaceService @Autowired constructor(
    private val palaceRepository: PalaceRepository
){
    /**
     * 코스 불러오기
     */
    @Transactional
    suspend fun getMyCourse() : List<PalaceResponseDto> {
        val result = palaceRepository.findAllPalaces()
        return result.map { PalaceResponseDto.fromEntity(it) }
    }


    /**
     * 코스 추가하기
     */
    @Transactional
    suspend fun savePalace(palaceRequestDto: PalaceRequestDto): PalaceResponseDto {
        val palace = palaceRequestDto.toEntity()
        val entityToSave = if (palace.id == 0L) {
            palace.copy(id = null)
        } else {
            palace
        }

        val result = palaceRepository.save(entityToSave)
        return PalaceResponseDto.fromEntity(result)
    }
}