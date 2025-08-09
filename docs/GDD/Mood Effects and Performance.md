---
created: Friday, August 8th 2025, 10:00:50 pm
modified: Friday, August 8th 2025, 10:14:05 pm
---
```table-of-contents
```

### **Mathematical Framework**

```
Effect Intensity = Base Effect × (|Mood Value| / 100) × Personality Modifier × Situation Modifier
```

### **Mood Categories & Effects**

#### **Angry (-100 To -1)**

**Performance Effects (Scaled by intensity):**

- **Red Card Chance:** Base +200% × (Anger/100) × Personality Modifier
- **Yellow Card Chance:** Base +150% × (Anger/100) × Personality Modifier
- **Passing Accuracy:** Base -40% × (Anger/100) × Personality Modifier
- **Tackling Aggression:** Base +50% × (Anger/100) × Personality Modifier
- **Team Cooperation:** Base -30% × (Anger/100) × Personality Modifier

**Examples:**

- At -20 Angry: +40% red card chance, -8% passing accuracy
- At -60 Angry: +120% red card chance, -24% passing accuracy
- At -100 Angry: +200% red card chance, -40% passing accuracy

#### **Unfocused (-100 To -1)**

**Performance Effects:**

- **Unnecessary Penalties:** Base +100% × (Unfocus/100) × Personality Modifier
- **Free Kick Giveaways:** Base +80% × (Unfocus/100) × Personality Modifier
- **Positioning Awareness:** Base -30% × (Unfocus/100) × Personality Modifier
- **Ball Retention:** Base -25% × (Unfocus/100) × Personality Modifier

#### **Anxious (-100 To -1)**

**Performance Effects:**

- **Crucial Moment Performance:** Base -50% × (Anxiety/100) × Personality Modifier
- **Penalty Miss Chance:** Base +300% × (Anxiety/100) × Personality Modifier
- **First Touch Quality:** Base -40% × (Anxiety/100) × Personality Modifier
- **Decision Making Speed:** Base -35% × (Anxiety/100) × Personality Modifier

#### **Confident (+1 To +100)**

**Performance Effects:**

- **Skill Execution Success:** Base +40% × (Confidence/100) × Personality Modifier
- **Leadership Actions:** Base +60% × (Confidence/100) × Personality Modifier
- **Risk-Taking Success:** Base +25% × (Confidence/100) × Personality Modifier
- **Pressure Resistance:** Base +50% × (Confidence/100) × Personality Modifier

#### **Euphoric (+80 To +100)**

**Special High-Confidence State:**

- **Performance Bonus:** (Mood/100) × 60%
- **BUT Overconfidence Risk:** ((Mood-79)/21) × 100% mistake chance
- **Showboating Attempts:** +300% (can backfire spectacularly)

### **Combined Mood Effects**

#### **Conflicting Moods (e.g., Angry + Confident)**

```
Dominant Effect = Stronger Mood × (1 - (Weaker Mood × 0.3))

Weaker Effect = Weaker Mood × 0.5 (internal conflict penalty)
```

#### **Complementary Negative Moods (e.g., Angry + Unfocused)**

```
Combined Penalty = √(Mood1² + Mood2²) × Synergy Multiplier (1.2)
```

#### **Positive Mood Stacking (e.g., Confident + Focused)**

```
Combined Bonus = (Mood1 + Mood2) × (1 - ((Mood1 + Mood2) × 0.002))

(Diminishing returns prevent overpowered states)
```

### **Personality Mood Multipliers**

#### **Hot-Headed Talent**

- Anger Effects: ×1.5 (gets MORE angry effects)
- Confidence Effects: ×1.3 (benefits more from confidence)
- Unfocused Effects: ×0.7 (focuses better under pressure)

#### **Pressure Performer**

- Anxiety Effects: ×0.3 (less affected by anxiety)
- Confident Effects: ×1.8 (massive confidence bonuses)
- Unfocused Effects: ×2.0 (severely affected when unfocused)

#### **Prima Donna**

- Anger Effects: ×2.0 (dramatic reactions)
- Euphoric Effects: ×1.5 (loves the spotlight)
- Unfocused Effects: ×1.2 (slightly more distracted)

### **Mood Decay & Recovery**

#### **Natural Decay Rates (Per Game Day)**

```
Daily Decay = Current_Mood × (1 - Decay_Rate)
```

Decay Rates by Intensity:

- Extreme moods (±80 to ±100): 15% daily decay
- Strong moods (±60 to ±79): 10% daily decay
- Moderate moods (±40 to ±59): 7% daily decay
- Mild moods (±20 to ±39): 5% daily decay
- Slight moods (±1 to ±19): 3% daily decay`

#### **Recovery Events & Triggers**

**Immediate Positive Boosts (+20 to +60):**

- Scoring crucial goal: +40 confidence, +30 euphoria
- Manager public backing: +35 confidence, +20 manager relationship
- Partner support message: +30 happiness, +15 focus
- Fan appreciation event: +25 confidence, +10 motivation
- Teammate solidarity: +20 team chemistry, +15 mood

**Gradual Recovery (+5 to +15 per day):**

- Consistent good training: +5 confidence daily
- Team bonding activities: +10 team chemistry
- Professional therapy: +15 mental stability, +10% faster recovery
- Rest and recovery time: +5 focus, -10 stress

**Immediate Negative Triggers (-20 to -80):**

- Missing match-winning penalty: -60 confidence, -40 focus
- Red card in important match: -50 mood, -30 team relationship
- Public manager criticism: -40 confidence, -25 manager relationship
- Partner relationship crisis: -80 happiness, -60 focus
- Media scandal exposure: -70 confidence, -50 public image

### **Mood Memory System**

Significant events create lasting psychological imprints:

Memory Structure:

- Event Description: "Missed Cup Final Penalty"
- Initial Impact: -60 confidence
- Trigger Conditions: Future penalty situations
- Trigger Probability: 30% chance
- Memory Intensity: Decreases 5% per month
- Override Conditions: Scoring crucial penalty
