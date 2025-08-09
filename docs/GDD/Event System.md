---
created: Friday, August 8th 2025, 10:02:52 pm
modified: Friday, August 8th 2025, 10:12:58 pm
---
```table-of-contents
```

### **Event Framework (Crusader Kings 3 Style)**

#### **Event Categories**

##### **1. Player-Generated Events**

**Personality-Driven Scenarios:**

- **Prima Donna Demands:** "Star Treatment Required"
    - _Trigger:_ Prima Donna benched for 2+ games
    - _Choices:_ Give special treatment / Stand firm / Compromise
    - _Consequences:_ Team chemistry vs player happiness vs precedent setting

- **Hot-Head Confrontation:** "Training Ground Explosion"
    - _Trigger:_ Hot-Head loses temper during training
    - _Choices:_ Public discipline / Private talk / Ignore incident
    - _Consequences:_ Team discipline vs player relationship vs future incidents

- **Rookie Homesickness:** "Far From Home"
    - _Trigger:_ Young foreign player struggling with adaptation
    - _Choices:_ Assign mentor / Allow family visit / Tough love approach
    - _Consequences:_ Development speed vs team resources vs character building

##### **2. Relationship Events**

**Partner-Related Scenarios:**

- **Celebrity Partner Drama:** "Spotlight Pressure"
    - _Trigger:_ Player's celebrity partner creates media attention
    - _Choices:_ Support publicly / Stay neutral / Distance from situation
    - _Consequences:_ Player loyalty vs media relations vs team focus

- **Long-Distance Relationship:** "Love vs Career"
    - _Trigger:_ Partner gets job opportunity in different country
    - _Choices:_ Support move / Convince to stay / Help find compromise
    - _Consequences:_ Player happiness vs relationship stability vs career focus

**Teammate Dynamics:**

- **Language Barrier Tension:** "Lost in Translation"
    - _Trigger:_ Communication breakdown between players
    - _Choices:_ Hire translator / Language lessons / Mixed training groups
    - _Consequences:_ Team chemistry vs budget vs long-term integration

##### **3. Team President Events** <www.onlinesportmanagers.com>

**Management Pressure:**

- **Unrealistic Expectations:** "Win or Else"
    - _Trigger:_ Poor run of results
    - _Choices:_ Promise improvements / Explain circumstances / Demand support
    - _Consequences:_ Job security vs player pressure vs president relationship

- **Transfer Interference:** "Presidential Signing"
    - _Trigger:_ President wants to sign expensive, unsuitable player
    - _Choices:_ Accept signing / Negotiate alternative / Refuse directly
    - _Consequences:_ Squad balance vs political relationship vs team chemistry

##### **4. Fan Events** <www.onlinesportmanagers.com>

**Supporter Dynamics:**

- **Fan Favorite Under-performing:** "Golden Boy Struggles"
    - _Trigger:_ Popular player in poor form
    - _Choices:_ Keep playing him / Bench despite pressure / Public explanation
    - _Consequences:_ Fan relations vs team performance vs player development

- **Protest at Training Ground:** "Supporter Uprising"
    - _Trigger:_ Extended poor results
    - _Choices:_ Meet with fans / Increase security / Address media
    - _Consequences:_ Fan relationship vs player safety vs media narrative

##### **5. Media Events** <www.onlinesportmanagers.com>

**Press Relations:**

- **Scandal Exposure:** "Dirty Laundry"
    - _Trigger:_ Player's personal issues become public
    - _Choices:_ Defend player / Distance club / No comment
    - _Consequences:_ Player loyalty vs club reputation vs media relations

- **Tactical Criticism:** "Expert Analysis"
    - _Trigger:_ Media questions your tactical decisions
    - _Choices:_ Defend approach / Admit mistakes / Attack critics
    - _Consequences:_ Credibility vs humility vs media relationship

### **Event Structure Template**

```json
{
  "event_id": "prima_donna_benching_crisis",
  "title": "Star Player Demands",
  "description": "Your star player [PLAYER_NAME] storms into your office after being benched for the third consecutive match. 'This is ridiculous! I'm the best player on this team and you're treating me like some reserve!'",
  "trigger_conditions": {
    "player_personality": "Prima Donna",
    "games_benched": ">=3",
    "player_mood": "<=-30"
  },
  "choices": [
    {
      "choice_id": "give_special_treatment",
      "text": "Promise him guaranteed starting position and special training privileges",
      "requirements": {},
      "immediate_effects": {
        "player_mood": "+40",
        "manager_relationship": "+20",
        "team_chemistry": "-15"
      },
      "long_term_consequences": {
        "other_players_mood": "-10",
        "future_event_triggers": [
          "team_favoritism_complaint"
        ],
        "precedent_set": "special_treatment_expected"
      }
    },
    {
      "choice_id": "stand_firm",
      "text": "Explain that no player is bigger than the team and he needs to earn his place",
      "requirements": {
        "manager_leadership": ">=60"
      },
      "immediate_effects": {
        "player_mood": "-20",
        "manager_relationship": "-30",
        "team_discipline": "+20"
      },
      "long_term_consequences": {
        "team_respect": "+15",
        "player_development": "+10",
        "future_event_triggers": [
          "player_transfer_request"
        ]
      }
    }
  ],
  "follow_up_events": [
    "media_asks_about_benching",
    "teammates_react_to_decision"
  ]
}
```

### **Event Chains & Consequences**

Events create cascading storylines that can span entire seasons:

**Example Chain: "The Prima Donna Saga"**

1. **Initial Event:** Star player benched, demands meeting
2. **Manager Choice:** Stand firm on team discipline
3. **Consequence Event:** Player leaks frustration to media
4. **Media Event:** Press asks about player relationship
5. **Fan Event:** Supporters divided - some support manager, others want star player
6. **Team Event:** Other players react to the drama
7. **Resolution Events:** Multiple possible endings based on accumulated choices

### **Dynamic Event Generation**

The system generates events based on:

- **Current team psychology state**
- **Recent match results and performances**
- **Relationship dynamics between characters**
- **Seasonal timing** (pre-season, mid-season, end-season)
- **External factors** (transfer windows, cup competitions)
- **Historical precedents** from previous choices
