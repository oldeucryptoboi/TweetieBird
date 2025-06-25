import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/bird_analysis.dart';
import '../models/wildlife_rehabber.dart';
import '../services/rehabber_service.dart';
import 'rehabber_list_widget.dart';

class AnalysisResultWidget extends StatefulWidget {
  final BirdAnalysis analysis;

  const AnalysisResultWidget({
    super.key,
    required this.analysis,
  });

  @override
  State<AnalysisResultWidget> createState() => _AnalysisResultWidgetState();
}

class _AnalysisResultWidgetState extends State<AnalysisResultWidget> {
  List<WildlifeRehabber>? _nearbyRehabbers;
  bool _isLoadingRehabbers = false;

  @override
  void initState() {
    super.initState();
    if (widget.analysis.needsRescue && widget.analysis.location != null) {
      _loadNearbyRehabbers();
    }
  }

  Future<void> _loadNearbyRehabbers() async {
    setState(() {
      _isLoadingRehabbers = true;
    });

    try {
      final rehabbers = await RehabberService.getNearbyRehabbers(
        widget.analysis.location!,
        species: widget.analysis.species,
      );
      setState(() {
        _nearbyRehabbers = rehabbers;
        _isLoadingRehabbers = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingRehabbers = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading rehabbers: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Color _getStatusColor() {
    if (widget.analysis.needsRescue) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  IconData _getStatusIcon() {
    if (widget.analysis.needsRescue) {
      return Icons.warning;
    } else {
      return Icons.check_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getStatusColor()),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Header
          Row(
            children: [
              Icon(
                _getStatusIcon(),
                color: _getStatusColor(),
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.analysis.needsRescue
                          ? 'Rescue Needed'
                          : 'No Rescue Required',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _getStatusColor(),
                      ),
                    ),
                    Text(
                      'Confidence: ${(widget.analysis.confidence * 100).toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Bird Information
          _buildInfoSection('Species', widget.analysis.species, Icons.pets),
          _buildInfoSection('Age', widget.analysis.age, Icons.cake),
          _buildInfoSection('Health Status', widget.analysis.healthStatus,
              Icons.health_and_safety),

          const SizedBox(height: 16),

          // Recommendation
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getStatusColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _getStatusColor().withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lightbulb,
                      color: _getStatusColor(),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Recommendation',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _getStatusColor(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.analysis.recommendation,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Explanation
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.blue[600],
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Explanation',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.analysis.explanation,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),

          // Nearby Rehabbers (if rescue is needed)
          if (widget.analysis.needsRescue) ...[
            const SizedBox(height: 20),
            if (_isLoadingRehabbers) ...[
              const Center(
                child: CircularProgressIndicator(),
              ),
            ] else if (_nearbyRehabbers != null) ...[
              if (_nearbyRehabbers!.isNotEmpty) ...[
                RehabberListWidget(
                  rehabbers: _nearbyRehabbers!,
                  species: widget.analysis.species,
                ),
              ] else ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange[200]!),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.orange[600]),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'No nearby rehabbers found. Please search online for wildlife rehabilitators in your area.',
                          style: TextStyle(color: Colors.orange[800]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildInfoSection(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
