package com.myspring.today;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.myspring.today.recipe.RecipeDAO;
import com.myspring.today.recipe.RecipeVO;

@Configuration
@EnableScheduling
public class Scheduler {
	@Autowired
	private RecipeDAO recipeDAO;
	
	// 스케줄러 테스트, 3초마다 실행
//	@Scheduled(fixedDelay = 3000)
//	public void test() {
//		System.out.println("dely 3000");
//	}

	// 자동으로 북마크 수 늘리기, 일간/주간 랭킹 비워짐 방지 및 db 커넥션 끊기는 거 방지, 7시간마다 실행
	@Scheduled(cron = "0 0 0/7 * * *")
	public void autoBookmark(){
		List<RecipeVO> recipeIdList=recipeDAO.getAllRecipeId();
		Random rand = new Random();
		for(int i=0;i<5;i++) {
			int recipeId=recipeIdList.get(rand.nextInt(recipeIdList.size())).getRecipeId();
			recipeDAO.upBookmarkCount(recipeId);
		}
	}
}
