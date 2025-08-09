---
created: Friday, August 8th 2025, 10:24:32 pm
modified: Friday, August 8th 2025, 11:55:16 pm
---
```table-of-contents
```

### **Core UI Principles**

1. **Psychology-First:** Mental states visible at all times
2. **Relationship-Centric:** Clear relationship status indicators
3. **Event-Driven:** Notifications and alerts for important events
4. **Mobile-Optimized:** Touch-friendly, thumb-accessible design
5. **Narrative Focus:** Emphasis on storytelling over statistics

### **Screen Flow Architecture**

#### **Main Menu**

- **Continue Career** (if save exists)
- **New Manager Career**
- **Settings**
- **Credits**
- **Daily Challenges** (optional content)

#### **Core Game Screens**

##### **1. Team Overview Dashboard**

**Primary Elements:**

- **Team Chemistry Indicator:** Large circular meter showing team unity (0-100)
- **Mood Overview:** Color-coded player cards showing dominant moods
- **Upcoming Events:** Timeline showing scheduled matches and important dates
- **Recent News:** Scrolling feed of team-related news and events

**Player Card Design:**

```
[Player Photo] [Name, Position]

Mood: 😠 Angry (-45) [Color: Red]

Confidence: ⭐⭐⭐☆☆ (60/100)

Manager Relationship: ❤️❤️❤️☆☆

Performance Trend: ↗️ Improving
```

##### **2. Player Detail Screen**

**Tab Structure:**

- **Psychology Tab:** Detailed mood breakdown, relationship status, recent events
- **Skills Tab:** RPG-style skill trees with progression paths
- **History Tab:** Career timeline, achievements, memorable moments
- **Training Tab:** Focus selection and development planning

**Psychology Tab Layout:**

```
Current Moods:

😠 Angry: -45 (High impact on performance)
😰 Anxious: -20 (Moderate impact)
😊 Confident: +30 (Positive influence)

Relationships:

Manager: ❤️❤️❤️☆☆ (65/100) "Respects your decisions"
Partner: 💕💕💕💕☆ (85/100) "Very supportive"
Team Chemistry: ❤️❤️❤️❤️☆ (78/100) "Well-liked teammate"

Recent Psychological Events:

• Scored winning goal (+40 confidence) - 3 days ago
• Criticized by media (-25 mood) - 1 week ago
• Partner attended match (+15 happiness) - 3 days ago`
```

##### **3. Event Screen (Crusader Kings Style)**

**Layout Structure:**

- **Event Title:** Large, dramatic header
- **Character Portraits:** Show involved parties with mood indicators
- **Narrative Text:** Rich description with flavor text
- **Choice Buttons:** Clear options with potential consequences preview
- **Context Panel:** Relevant background information

**Example Event Screen:**

```
🔥 CRISIS IN THE DRESSING ROOM

[Player Portrait: Marcus Silva - Angry -80]
[Manager Portrait: You - Stressed +25]

Your star striker Marcus Silva storms into your office after being benched for the third consecutive match. His eyes are blazing with fury, and several teammates are watching through the glass door.

"This is absolutely ridiculous! I'm the top scorer on this team and you're treating me like some bench warmer! The fans are asking questions, the media is having a field day, and my agent is breathing down my neck!"

CHOOSE YOUR RESPONSE:

[🤝 COMPROMISE]

"Let's find a middle ground that works for both of us"

• Marcus mood: +20
• Team discipline: -10
• Sets precedent for future negotiations

[💪 STAND FIRM]

"No player is bigger than the team - earn your spot back"

• Requires Leadership 65+ (You have 58 - HIGH RISK)
• Marcus mood: -30, but potential respect gain
• Team discipline: +20

[🗣️ PRIVATE MEETING]

"Come to my office tomorrow - we'll talk properly"

• Delays decision, allows time to think
• Small mood improvement: +5
• Unlocks additional options tomorrow
```

##### **4. Match Day Interface**

**Pre-Match:**

- **Team Psychology Summary:** Overall team mood and confidence
- **Key Player Status:** Highlight players with significant mood effects
- **Opposition Analysis:** Scouting report with psychological insights
- **Team Talk Options:** Multiple approaches based on manager skills

**During Match:**

- **Live Psychology Tracking:** Real-time mood changes during match
- **Event Notifications:** Pop-ups for psychological moments (goals, cards, substitutions)
- **Tactical Adjustments:** Options to respond to psychological situations
- **Player Reactions:** Visual feedback showing how events affect different personalities

**Post-Match:**

- **Psychology Report:** How the match affected each player
- **Relationship Changes:** Updates to manager-player relationships
- **Media Opportunities:** Optional press conference with psychological implications

##### **5. Training & Development**

**Weekly Training Planner:**

- **Individual Focus:** Set training emphasis for each player
- **Team Activities:** Group sessions affecting chemistry and relationships
- **Special Sessions:** Psychological training, team building, conflict resolution

**Training Session Results:**

```
TECHNICAL TRAINING SESSION - Day 3

Participants: Full Squad

Focus: Passing and Movement

Results:

✅ Marcus Silva: +50 XP Technical Skills
Mood: +5 (Enjoyed working on skills)

⚠️ David Chen: +30 XP Technical Skills
Mood: -10 (Frustrated with complex drills)

✅ Team Chemistry: +2 (Good group cooperation)

Special Event Triggered:

🎯 "Veteran Teaching Moment"

Roberto Martinez took time to help young players with technique.
Team chemistry +5, Young player development +15%
```

##### **6. Transfer & Recruitment**

**Player Search:**

- **Personality Filters:** Search by personality types
- **Psychology Compatibility:** Show how potential signings would fit team chemistry
- **Relationship Predictions:** Forecast potential conflicts or synergies

**Negotiation Interface:**

- **Player Motivation:** What drives the player (money, trophies, playing time)
- **Agent Relationship:** History and rapport with player's representative
- **Psychology Impact:** How signing would affect current squad

### **Mobile-Specific Design Considerations**

#### **Touch Interactions**

- **Swipe Navigation:** Between player cards and screens
- **Long Press:** Access detailed information and context menus
- **Pinch to Zoom:** On tactical boards and relationship diagrams
- **Pull to Refresh:** Update team status and check for new events

#### **Screen Adaptation**

- **Portrait Mode Primary:** Optimized for one-handed use
- **Landscape Support:** For tactical screens and detailed analysis
- **Dynamic Text Sizing:** Accessibility options for different vision needs
- **Gesture Shortcuts:** Quick access to frequently used functions

#### **Notification System**

- **Push Notifications:** For important events when app is closed
- **In-App Alerts:** Immediate notifications for psychology changes
- **Priority Levels:** Different notification styles for varying importance
- **Customizable:** Players can choose which events to be notified about

### **Visual Design Language**

#### **Color Psychology**

- **Red Spectrum:** Anger, conflict, urgent attention needed
- **Blue Spectrum:** Calm, confidence, positive relationships
- **Green Spectrum:** Growth, improvement, successful outcomes
- **Yellow/Orange:** Caution, moderate concern, neutral states
- **Purple:** Excellence, special achievements, rare events

#### **Typography**

- **Headlines:** Bold, impactful fonts for event titles and important information
- **Body Text:** Clean, readable fonts optimized for mobile screens
- **UI Elements:** Clear, functional fonts for buttons and navigation
- **Flavor Text:** Slightly stylized fonts for narrative elements

#### **Iconography**

- **Mood Icons:** Emoji-style representations of emotional states
- **Relationship Icons:** Heart variations for different relationship levels
- **Skill Icons:** RPG-style icons for different abilities and attributes
- **Event Icons:** Distinctive symbols for different event types
