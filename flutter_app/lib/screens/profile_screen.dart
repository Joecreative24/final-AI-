import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../providers/user_provider.dart';
import '../providers/learning_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/brain_logo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Settings functionality
            },
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: Consumer2<UserProvider, LearningProvider>(
        builder: (context, userProvider, learningProvider, child) {
          final user = userProvider.user;
          if (user == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildProfileHeader(user),
                const SizedBox(height: 32),
                _buildStatsGrid(user, learningProvider),
                const SizedBox(height: 24),
                _buildAchievements(),
                const SizedBox(height: 24),
                _buildSettings(),
                const SizedBox(height: 100), // Space for bottom nav
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _navigateToPage(index);
        },
      ),
    );
  }

  Widget _buildProfileHeader(user) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 50,
          ),
        ).animate().scale(delay: 200.ms, duration: 600.ms, curve: Curves.elasticOut),
        
        const SizedBox(height: 16),
        
        Text(
          user.name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
        
        Text(
          user.email,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
        
        const SizedBox(height: 8),
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BrainLogo(size: 20, showGraduation: false),
              const SizedBox(width: 8),
              Text(
                'Learning since ${_formatDate(user.joinDate)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildStatsGrid(user, learningProvider) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildStatCard(
          'Learning Hours',
          '${user.totalLearningHours}h',
          Icons.access_time,
          AppColors.primaryBlue,
          0,
        ),
        _buildStatCard(
          'Completed Lessons',
          '${user.completedLessons}',
          Icons.check_circle,
          AppColors.success,
          1,
        ),
        _buildStatCard(
          'Subjects',
          '${learningProvider.subjects.length}',
          Icons.school,
          AppColors.primaryTeal,
          2,
        ),
        _buildStatCard(
          'Daily Streak',
          '7 days',
          Icons.local_fire_department,
          AppColors.warning,
          3,
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, int index) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate(delay: Duration(milliseconds: 700 + (index * 100)))
     .fadeIn(duration: 600.ms)
     .scale(begin: const Offset(0.8, 0.8));
  }

  Widget _buildAchievements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ).animate(delay: 1100.ms).fadeIn(duration: 600.ms),
        
        const SizedBox(height: 16),
        
        Row(
          children: [
            _buildAchievementBadge('🎓', 'First Lesson', true),
            const SizedBox(width: 12),
            _buildAchievementBadge('🔥', 'Week Streak', true),
            const SizedBox(width: 12),
            _buildAchievementBadge('📚', 'Subject Master', false),
            const SizedBox(width: 12),
            _buildAchievementBadge('🏆', 'Champion', false),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementBadge(String emoji, String title, bool isEarned) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isEarned ? AppColors.accentYellow.withOpacity(0.2) : AppColors.lightGray,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isEarned ? AppColors.accentYellow : AppColors.textLight,
          ),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: TextStyle(
                fontSize: 24,
                color: isEarned ? Colors.black : AppColors.textLight,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isEarned ? AppColors.textPrimary : AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate(delay: Duration(milliseconds: 1200 + (title.length * 50)))
     .fadeIn(duration: 600.ms)
     .scale(begin: const Offset(0.8, 0.8));
  }

  Widget _buildSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ).animate(delay: 1500.ms).fadeIn(duration: 600.ms),
        
        const SizedBox(height: 16),
        
        _buildSettingItem(
          Icons.notifications_outlined,
          'Notifications',
          'Manage your learning reminders',
          () {},
        ),
        _buildSettingItem(
          Icons.palette_outlined,
          'Theme',
          'Customize your app appearance',
          () {},
        ),
        _buildSettingItem(
          Icons.help_outline,
          'Help & Support',
          'Get help with the app',
          () {},
        ),
        _buildSettingItem(
          Icons.info_outline,
          'About',
          'App version and information',
          () {},
        ),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.lightGray,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ).animate(delay: Duration(milliseconds: 1600 + (title.length * 20)))
     .fadeIn(duration: 600.ms)
     .slideX(begin: 0.1);
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/subjects');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/ai-tutor');
        break;
      case 3:
        // Already on profile
        break;
    }
  }
}